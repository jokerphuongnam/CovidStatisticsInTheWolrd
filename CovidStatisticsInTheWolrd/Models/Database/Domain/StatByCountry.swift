import Foundation
import RealmSwift

public final class StatByCountry: Object, Codable {
    
    public required init() {
        super.init()
    }
    
    public override class func primaryKey() -> String? {
        return "_pCountry"
    }
    
    @objc dynamic private var _pCountry: String? = ""
    private var _pLatestStatByCountry: List<LastedStat>? = nil
    
    public var country: String? {get{_pCountry}}
    public var latestStatByCountry: List<LastedStat>? {get{_pLatestStatByCountry}}
    
    enum CodingKeys: String, CodingKey {
        case _pCountry = "country"
        case _pLatestStatByCountry = "latest_stat_by_country"
    }
}
