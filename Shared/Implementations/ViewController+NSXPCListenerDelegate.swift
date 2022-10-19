import Foundation

extension ViewController: NSXPCListenerDelegate {
    func listener(_ listener: NSXPCListener, shouldAcceptNewConnection newConnection: NSXPCConnection) -> Bool {
        logger.notice("View controller should accept new connection...")
        configureConnection(newConnection)
        return true
    }
}
