import UIKit

extension UIViewController {
    //get object from AppDelegate
    func resolve<T>() -> T {
        return (UIApplication.shared.delegate as! AppDelegate).container.resolve(T.self)!
    }
}
