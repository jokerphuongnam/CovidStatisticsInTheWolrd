import Foundation
import RealmSwift

public final class StatByCountry: Object, Codable {
    public init(_ country: String?, _ latestStatByCountry: [LastedStat]?) {
        self._pCountry = country
        self._pLatestStatByCountry = latestStatByCountry
    }
    
    public required init() {
        super.init()
    }
    
    private var _pCountry: String? = ""
    private var _pLatestStatByCountry: [LastedStat]? = [LastedStat]()
    
    public var country: String? {get{_pCountry}}
    public var latestStatByCountry: [LastedStat]? {get{_pLatestStatByCountry}}
    
    enum CodingKeys: String, CodingKey {
        case _pCountry = "country"
        case _pLatestStatByCountry = "latest_stat_by_country"
    }
}
