import PromiseKit

public protocol CountryFlagsNetworkProtocol {
    //Lấy country flag từ mạng
    func fetchCountryFlag(with countryCode: String,have width: Int,and height: Int) -> Promise<UIImage?>
}

fileprivate extension CountryFlagsNetworkProtocol {
    //trang để lấy country flag
    var domainUrl: String {get{"https://flagcdn.com/"}}
    //đuổi ảnh nhận về
    var tailUrl: String{get{"png"}}
}

public final class DefaultCountryFlagsNetwork: CountryFlagsNetworkProtocol{
    //Lấy country flag từ mạng
    public func fetchCountryFlag(with countryCode: String, have width: Int, and height: Int) -> Promise<UIImage?> {
        Promise<UIImage?> { (resolver) in
            //gỡ optional cho url
            guard let url: URL = URL(string: "\(self.domainUrl)\(width)x\(height)/\(countryCode).\(self.tailUrl)")else {
                resolver.reject(AppError.urlNil)
                return
            }
            do {
                let data: Data = try Data(contentsOf: url)
                //nếu decode được data lấy từ mạng thì bắn lên bằng Promise
                resolver.fulfill(UIImage(data: data))
            }catch{
                //nếu có lỗi của AlamoreFire
                resolver.reject(error)
            }
        }
    }
}
