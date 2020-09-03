import Foundation
import PromiseKit

//lấy dữ liệu từ online sau đó lưu về offline và trả về dữ liệu
public protocol CountrysFlagsRepositoryProtocol {
    var network: CountryFlagsNetworkProtocol {get}
    var local: CountryCodeLocalProtocol {get}
    var utils: UtilsNetworkProtocol {get}
    
    //lấy cờ có kích thước widhtxheight theo countryCode
    func fetchCountryFlag(with countryCode: String, have width: Int, and height: Int) -> Promise<UIImage?>
}
