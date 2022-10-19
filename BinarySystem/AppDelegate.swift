import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Launch the companion app, too!
        guard let assistantExecutable = Bundle.main.url(forAuxiliaryExecutable: "Companion.app") else {
            assertionFailure("Failed to find the companion in the main bundle!")
            return
        }

        logger.notice("Launching the companion app...")
        NSWorkspace.shared.open(assistantExecutable)
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return false
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
}

