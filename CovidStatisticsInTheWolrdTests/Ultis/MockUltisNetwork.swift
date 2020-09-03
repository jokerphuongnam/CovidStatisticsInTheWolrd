import Foundation
import PromiseKit
import Network
@testable import CovidStatisticsInTheWolrd

class MockUtilsNetwork: UtilsNetworkProtocol{
    var monitor: NWPathMonitor = NWPathMonitor()
    
    var _queue: DispatchQueue? = nil
    
    var deferredPromise = Promise<NWPath.Status>.pending()
    
    func statusConnectedInternet() -> Promise<NWPath.Status> {
        deferredPromise.resolver.fulfill(.satisfied)
        return deferredPromise.promise
    }
}
