import Foundation

@objc protocol Serving {
    static var shared: Serving { get }
    
    func doSomething(_ completionHandler: @escaping () -> Void)
}
