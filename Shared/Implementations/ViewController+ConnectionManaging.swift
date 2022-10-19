import Foundation

// MARK: Default Implementations

extension ConnectionManaging {
    func configureConnection(_ connection: NSXPCConnection) {
        logger.notice("Configuring connection \(connection)...")

        connection.exportedInterface = NSXPCInterface(with: Serving.self)
        connection.exportedObject = Service()
        connection.remoteObjectInterface = NSXPCInterface(with: Serving.self)

        connection.interruptionHandler = {
            logger.error("Interruption handler for connection called!")
        }

        connection.invalidationHandler = {
            logger.error("Invalidation handler for connection called!")
        }

        logger.notice("Resuming new connection...")
        connection.resume()
        logger.notice("New connection returned from resumption!")
        self.connection = connection
    }

    func createListener() {
        logger.notice("Creating listener...")

        let listener = NSXPCListener.service()
        listener.delegate = self

        logger.notice("Listener resumes...")
        listener.resume()
        logger.notice("Listener returned from resumption!")

        self.listener = listener
    }

    func getRemoteObjectProxy() -> Serving? {
        logger.notice("Getting remote object proxy...")

        if connection == nil {
            logger.notice("Creating a new connection because there is none existent...")
            configureConnection(NSXPCConnection(serviceName: self.remoteServiceName))
        }

        guard let proxy = connection?.remoteObjectProxyWithErrorHandler({ error in logger.error("Failed to retrieve remote object proxy: \(error.localizedDescription)") }) as? Serving else {
            return nil
        }

        logger.notice("Returning remote object proxy...")

        return proxy
    }
}
