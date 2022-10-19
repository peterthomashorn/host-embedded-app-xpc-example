import Cocoa

class ViewController: NSViewController, ConnectionManaging {
    var connection: NSXPCConnection?
    var listener: NSXPCListener?
    let remoteServiceName: String = "com.open-xchange.BinarySystem"

    override func viewDidLoad() {
        createListener()
    }

    @IBAction func callCodeInMainApp(_ sender: Any) {
        guard let proxy = getRemoteObjectProxy() else {
            logger.error("Failed to acquire remote object proxy!")
            return
        }

        proxy.doSomething {
            logger.notice("Completion handler of doSomething() called.")
        }
    }
}
