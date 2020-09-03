import Foundation
import PromiseKit

public protocol CoronaVirusMonitorLocalProtocol{
    //lấy thống kê theo quốc gia từ Local
    func getStatByCountry(with countryCode: String) -> Promise<StatByCountry?>
    //lấy thống kê theo quốc gia từ Local
    func addStatByCountry(_ statByCountry: StatByCountry)
    //lấy thống kê của thế giới từ Local
    func getWorldTotalStat() -> Promise<LastedStat?>
    //thêm dữ liệu thống kê của thế giới
    func addWorldTotalStat(_ worldTotalStat: LastedStat)
}
