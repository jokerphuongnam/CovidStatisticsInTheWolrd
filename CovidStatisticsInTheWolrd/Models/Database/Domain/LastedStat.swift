import Foundation
import RealmSwift

public final class LastedStat : Object,Codable {
    
    public required init() {
        super.init()
    }
    
    public override class func primaryKey() -> String? {
        return "_key"
    }
    
    @objc dynamic private var _key: String! = ""
    @objc dynamic private var _pTotalCases: String! = ""
    @objc dynamic private var _pNewases: String! = ""
    @objc dynamic private var _pTotalDeaths: String! = ""
    @objc dynamic private var _pNewDeaths: String! = ""
    @objc dynamic private var _pTotalRecovered: String! = ""
    @objc dynamic private var _pActiveCases: String! = ""
    @objc dynamic private var _pSeriousCritical: String! = ""
    
    public var key: String? {get{_key} set{_key = newValue}}
    public var totalCases: String?{get{_pTotalCases}}
    public var newases: String?{get{_pNewases}}
    public var totalDeaths: String?{get{_pTotalDeaths}}
    public var newDeaths: String?{get{_pTotalRecovered}}
    public var totalRecovered: String?{get{_pTotalCases}}
    public var activeCases: String?{get{_pActiveCases}}
    public var seriousCritical: String?{get{_pSeriousCritical}}
    
    enum CodingKeys: String, CodingKey {
        case _pTotalCases = "total_cases"
        case _pNewases = "new_cases"
        case _pTotalDeaths = "total_deaths"
        case _pNewDeaths = "new_deaths"
        case _pTotalRecovered = "total_recovered"
        case _pActiveCases = "active_cases"
        case _pSeriousCritical = "serious_critical"
    }
}
