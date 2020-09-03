import Foundation
import PromiseKit
import Network

public protocol UtilsNetworkProtocol{
    var monitor: NWPathMonitor {get}
    var _queue: DispatchQueue? {get set}
    //Kiểm tra việc kết nối mạng
    func statusConnectedInternet() -> Promise<NWPath.Status>
}

fileprivate extension UtilsNetworkProtocol {
    //Tạo luồng
    var queue: DispatchQueue? {
        get{
            var parent: UtilsNetworkProtocol = self
            if parent._queue == nil{
                parent._queue = DispatchQueue(label: "Monitor")
            }
            return parent._queue
        }
    }
}

public final class DefaultUtilsNetwork: UtilsNetworkProtocol {
    public var _queue: DispatchQueue? = nil
    
    init(_ monitor: NWPathMonitor){
        self.monitor = monitor
    }
    
    public var monitor: NWPathMonitor
    
    //Kiểm tra việc kết nối mạng
    public func statusConnectedInternet() -> Promise<NWPath.Status> {
        Promise<NWPath.Status>{resolver in
            monitor.pathUpdateHandler = {path in
                resolver.fulfill(path.status)
            }
            monitor.start(queue: queue!)
        }
    }
}
