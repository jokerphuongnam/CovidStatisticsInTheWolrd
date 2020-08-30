import Foundation
import PromiseKit

//lấy dữ liệu từ online sau đó lưu về offline và trả về dữ liệu
protocol CoronaVirusMonitorRepositoryProtocol {
    var network: CoronaVirusMonitorNetworkProtocol {get}
    var local: CoronaVirusMonitorLocalProtocol {get}
    
    //lấy thống kê theo quốc gia
    func fetchStatByCountry(with countryCode: String) -> Promise<StatByCountry?>
    //lấy thống kê của thế giới
    func fetchWorldTotalStat() -> Promise<LastedStat?>
}
