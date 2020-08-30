import Foundation
import PromiseKit

//lưu và xử lý dữ liệu cho màn hình StatisticByWorld
protocol StatisticByWorldViewModelProtocol {
    var useCase: StatisticByWorldUseCaseProtocol {get}
    
    func fetchStatByCountry(with countryCode: String)
    func fetchCountryFlag(with countryCode: String, have width: Int, and height: Int)
    func getCountryCodes(with fileName: String) -> [String: String]
    func getCountryCode(with countryName: String) -> String
}
