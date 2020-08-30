import Foundation
import UIKit

protocol CountryCodeLocalProtocol {
    var countryCodes : [String: String]! {get}
    
    //lấy 1 countryCode từ dictionary (countryCodeList)
    func getCountryCode(with countryName: String) throws -> String?
    //lấy toàn bộ countryCode từ Local xong lưu vào 1 dictionary (countryCodeList)
    func getCountryCodes() throws -> [String: String]?
    //lấy countryCode từ Local để lưu vào dictionary(countryCodeList)
    func fetchCountryCodes() throws
    
    var fileName: String {get}
}

public class DefaultCountryCodeLocal: CountryCodeLocalProtocol{
    var fileName: String = "ListCountryCode"
    
    private var encode: JSONEncoder = JSONEncoder()
    private var decode: JSONDecoder = JSONDecoder()
    
    internal var countryCodes: [String : String]!
    
    //nạp dữ liệu vào dictionary (countryCodeList)
    func fetchCountryCodes() throws {
        guard let asset = NSDataAsset(name: fileName) else {
            throw AppError.cannotOpenAsset(mess: "Cannot open \(fileName)")
        }
        do{
            countryCodes = try decode.decode([String : String].self, from: asset.data)
            countryCodes = countryCodes.sorted { $0.value < $1.value}.reduce([String: String]()) {
                var dict: [String: String] = $0
                dict.updateValue($1.value.lowercaseAndTrimSpace, forKey: $1.key.lowercaseAndTrimSpace)
                return dict
            }
        } catch {
            throw error
        }
    }
    
    //lấy 1 countryCode từ dictionary (countryCodeList)
    func getCountryCode(with countryName: String) throws -> String? {
        //nếu dictionary bị rỗng thì lấy dữ liệu từ local lên
        if countryCodes == nil {
            do{
                try fetchCountryCodes()
            } catch {
                //lấy không được thì quăng error
                throw error
            }
        }
        return countryCodes[countryName.lowercaseAndTrimSpace]
    }
    
    //lấy toàn bộ countryCode từ Data Asset xong lưu vào 1 dictionary (countryCodeList)
    func getCountryCodes() throws -> [String : String]? {
        if countryCodes == nil {
            guard let asset = NSDataAsset(name: fileName) else {
                return nil
            }
            do{
                countryCodes = try decode.decode([String : String].self, from: asset.data)
            } catch {
                throw error
            }
        }
        return countryCodes
    }
}
