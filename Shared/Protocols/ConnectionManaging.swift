import Foundation

protocol ConnectionManaging: NSXPCListenerDelegate {
    /// This is either self-created or previously incoming.
    var connection: NSXPCConnection? { get set }

    /// Listener for incoming XPC connections.
    var listener: NSXPCListener? { get set }

    /// Name of the XPC service to connect to.
    var remoteServiceName: String { get }

    /// Set up and store either an incoming or self-created connection.
    func configureConnection(_ connection: NSXPCConnection)

    /// Create the XPC listener.
    func createListener()

    /// Return the remote object proxy.
    func getRemoteObjectProxy() -> Serving?
}
