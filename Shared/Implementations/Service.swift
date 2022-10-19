import Foundation

class Service: Serving {
    static let shared: Serving = Service()

    func doSomething(_ completionHandler: @escaping () -> Void) {
        logger.notice("Service should do something!")
        completionHandler()
    }
}
