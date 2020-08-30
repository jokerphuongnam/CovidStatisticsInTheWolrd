import PromiseKit
import Alamofire

protocol CoronaVirusMonitorNetworkProtocol {
    var utils: UtilsNetworkProtocol {get}
    
    //thống kê dữ liệu theo quốc gia
    func fetchStatByCountry(with countryCode: String) -> Promise<StatByCountry?>
    //thống kê dữ liệu theo quốc gia
    func fetchWorldTotalStat() -> Promise<LastedStat?>
}

extension CoronaVirusMonitorNetworkProtocol {
    //trang để lấy thông kê về corona
    var domainUrl: String {get {"https://coronavirus-monitor.p.rapidapi.com/coronavirus/"}}
    //dictionary headers mà rapidapi yêu cầu
    var headersRequest: [String: String] {
        get {
            [
                "x-rapidapi-host": "coronavirus-monitor.p.rapidapi.com",
                "x-rapidapi-key": "7e76f10e3dmsh6b473751bf05c55p1480d5jsnbeaf3617ab9a"
            ]
        }
    }
}

class CoronaVirusMonitorAlamofire : CoronaVirusMonitorNetworkProtocol{
    init(utils : UtilsNetworkProtocol){
        self.utils = utils
    }
    
    internal var utils: UtilsNetworkProtocol
    
    //tạo parameter để query dữ liệu trên trang
    private lazy var parameter: [String:String] = [:]
    //tạo HTTPHearder cho AlamoreFire từ dictionary
    private lazy var headers: HTTPHeaders = HTTPHeaders(self.headersRequest)
    
    //thống kê dữ liệu theo quốc gia
    func fetchStatByCountry(with countryCode: String) -> Promise<StatByCountry?> {
        Promise<StatByCountry?> { (resolver) in
            let _: Promise<Void> = firstly {
                utils.statusConnectedInternet()
            }.done { (status) in
                switch status {
                //nếu có mạng
                case .satisfied:
                    self.parameter["alpha3"] = countryCode
                    AF.request("\(self.domainUrl)latest_stat_by_iso_alpha_3.php", parameters: self.parameter,encoder: URLEncodedFormParameterEncoder.default, headers: self.headers).responseDecodable(of: StatByCountry.self) { (reponse) in
                        switch reponse.result {
                        case .success(let data):
                            //nếu decode được data lấy từ mạng thì bắn lên bằng Promise
                            resolver.fulfill(data)
                        case .failure(let error):
                            //nếu có lỗi của AlamoreFire
                            resolver.reject(error)
                        }
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
            }
        }
    }
    
    //thống kê dữ liệu của thế giới
    func fetchWorldTotalStat() -> Promise<LastedStat?> {
        Promise<LastedStat?> { (resolver) in
            AF.request("\(domainUrl)worldstat.php", method: .get, parameters: nil, headers: headers).responseDecodable(of: LastedStat.self) { (reponse) in
                let _: Promise<Void> = firstly{
                    self.utils.statusConnectedInternet()
                }.done { (status) in
                    switch status {
                    //nếu có mạng
                    case .satisfied:
                        switch reponse.result {
                        case .success(let data):
                            //nếu decode được data lấy từ mạng thì bắn lên bằng Promise
                            resolver.fulfill(data)
                        case .failure(let error):
                            //nếu có lỗi của AlamoreFire
                            resolver.reject(error)
                        }
                    case .unsatisfied:
                        resolver.reject(AppError.cannotConnectedInternet(mess: "Don't have"))
                    //nếu khi có wifi mà chưa xác nhận nên không thể kết nối mạng
                    case .requiresConnection:
                        resolver.reject(AppError.cannotConnectedInternet(mess: "Use without Internet"))
                    @unknown default:
                        break
                    }
                }
            }
        }
    }
}
