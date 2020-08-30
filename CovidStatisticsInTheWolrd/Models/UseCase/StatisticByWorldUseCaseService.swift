import Foundation
import PromiseKit

//tổng hợp các repository cho màn hình StatisticByWorld
protocol StatisticByWorldUseCaseProtocol {
    var repoCountryFlags: CountrysFlagsRepositoryProtocol {get}
    var repoCoronaVirusMonitor: CoronaVirusMonitorRepositoryProtocol {get}
    var repoCountryCode: CountryCodeRepositoryProtocol {get}
    
    //lấy thông tin theo quốc gia (thông tin và cờ)
    func fetchStatByCountry(with countryCode: String, have width: Int, and height: Int) -> Promise<StatByCountry?>
    //lấy dữ list countryCode
    func getCountryCodes(with fileName: String) -> [String: String]
    //lấy countryCode theo quốc gia
    func getCountryCode(with countryName: String) -> String
}
