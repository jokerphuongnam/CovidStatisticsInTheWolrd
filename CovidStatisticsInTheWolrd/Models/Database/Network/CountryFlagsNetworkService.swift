import PromiseKit

protocol CountryFlagsNetworkProtocol {
    var utils: UtilsNetworkProtocol {get}
    
    //Lấy country flag từ mạng
    func fetchCountryFlag(with countryCode: String,have width: Int,and height: Int) -> Promise<UIImage?>
}

extension CountryFlagsNetworkProtocol {
    //trang để lấy country flag
    var domainUrl: String {get{"https://flagcdn.com/"}}
    //đuổi ảnh nhận về
    var tailUrl: String{get{"png"}}
}

class DefaultCountryFlagsNetwork: CountryFlagsNetworkProtocol{
    init(utils : UtilsNetworkProtocol){
        self.utils = utils
    }
    
    internal var utils: UtilsNetworkProtocol
    
    //Lấy country flag từ mạng
    func fetchCountryFlag(with countryCode: String, have width: Int, and height: Int) -> Promise<UIImage?> {
        Promise<UIImage?> { (resolver) in
            firstly {
                utils.statusConnectedInternet()
            }.done { (status) in
                switch status {
                    //nếu có mạng
                case .satisfied:
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
                    //nếu không có mạng thì báo lỗi để xử lý
                case .unsatisfied:
                    resolver.reject(AppError.cannotConnectedInternet(mess: "Don't have"))
                    //nếu khi có wifi mà chưa xác nhận nên không thể kết nối mạng
                case .requiresConnection:
                    resolver.reject(AppError.cannotConnectedInternet(mess: "Use without Internet"))
                @unknown default:
                    break
                }
            }.catch { (error) in
                resolver.reject(error)
            }
        }
    }
}
