import Foundation
import PromiseKit

//lấy dữ liệu từ online sau đó lưu về offline và trả về dữ liệu
protocol CountrysFlagsRepositoryProtocol {
    var network: CountryFlagsNetworkProtocol {get}
    var local: CountryCodeLocalProtocol {get}
    
    //lấy cờ có kích thước widhtxheight theo countryCode
    func fetchCountryFlag(with countryCode: String, have width: Int, and height: Int) -> Promise<UIImage?>
}
