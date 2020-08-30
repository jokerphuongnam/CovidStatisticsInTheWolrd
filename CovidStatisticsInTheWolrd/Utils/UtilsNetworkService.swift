import Foundation
import PromiseKit
import Network

protocol UtilsNetworkProtocol{
    var monitor: NWPathMonitor {get}
    var _queue: DispatchQueue? {get set}
    //Kiểm tra việc kết nối mạng
    func statusConnectedInternet() -> Promise<NWPath.Status>
}

extension UtilsNetworkProtocol {
    //Tạo luồng
    internal var queue: DispatchQueue? {
        get{
            var parent: UtilsNetworkProtocol = self
            if parent._queue == nil{
                parent._queue = DispatchQueue(label: "Monitor")
            }
            return parent._queue
        }
    }
}

class DefaultUtilsNetwork: UtilsNetworkProtocol {
    internal var _queue: DispatchQueue? = nil
    
    init(_ monitor: NWPathMonitor){
        self.monitor = monitor
    }
    
    internal var monitor: NWPathMonitor
    
    //Kiểm tra việc kết nối mạng
    func statusConnectedInternet() -> Promise<NWPath.Status> {
        Promise<NWPath.Status>{resolver in
            monitor.pathUpdateHandler = {path in
                resolver.fulfill(path.status)
            }
            monitor.start(queue: queue!)
        }
    }
}
