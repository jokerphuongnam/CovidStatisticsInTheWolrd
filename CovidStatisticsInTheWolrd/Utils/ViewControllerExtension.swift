import UIKit

extension UIViewController: ContainerInject{
    public typealias Container = ContainerSwinject
    
    //get object from AppDelegate
    public func resolve<T>() -> T {
        return container.resolve()
    }
}
