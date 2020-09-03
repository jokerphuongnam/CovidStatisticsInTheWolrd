import UIKit

public extension UIViewController {
    //get object from AppDelegate
    func resolve<T>() -> T {
        return ContainerSwinject.instance.resolve()
    }
}
