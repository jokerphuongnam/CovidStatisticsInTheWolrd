//class nào cần tiêm chỉ cần kế thừa protocol này
public protocol ContainerInject {
    //Container phải được kế thừa từ ContainerObjectProtocal
    associatedtype Container : ContainerObjectProtocal
    
    func resolve<T>() -> T
}

extension ContainerInject {
    //lấy container ra
    var container: Container{
        get{
            return Container.instance
        }
    }
}
