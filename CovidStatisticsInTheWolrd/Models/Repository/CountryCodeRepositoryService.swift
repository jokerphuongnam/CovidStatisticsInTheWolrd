import Foundation

//lấy dữ liệu từ online sau đó lưu về offline và trả về dữ liệu
public protocol CountryCodeRepositoryProtocol {
    var local: CountryCodeLocalProtocol? {get}
    
    //lấy toàn bộ thông tin country code
    func getCountryCodes() -> [String: String]
    //lấy country code của 1 quốc gia
    func getCountryCode(with countryName: String) -> String
}
