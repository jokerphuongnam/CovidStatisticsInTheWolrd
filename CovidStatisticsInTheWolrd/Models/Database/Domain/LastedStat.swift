import Foundation
import RealmSwift

public final class LastedStat : Object,Codable {
    public init(_ totalCases: String,_ newases: String,_ totalDeaths: String,_ newDeaths: String,_ totalRecovered: String,_ activeCases: String, _ seriousCritical: String) {
        self._pTotalCases = totalCases
        self._pNewases = newases
        self._pTotalDeaths = totalDeaths
        self._pNewDeaths = newDeaths
        self._pTotalRecovered = totalRecovered
        self._pActiveCases = activeCases
        self._pSeriousCritical = seriousCritical
    }
    
    public required init() {
        super.init()
    }
    
    private var _pTotalCases: String = ""
    private var _pNewases: String = ""
    private var _pTotalDeaths: String = ""
    private var _pNewDeaths: String = ""
    private var _pTotalRecovered: String = ""
    private var _pActiveCases: String = ""
    private var _pSeriousCritical: String = ""
    
    public var totalCases: String{get{_pTotalCases}}
    public var newases: String{get{_pNewases}}
    public var totalDeaths: String{get{_pTotalDeaths}}
    public var newDeaths: String{get{_pTotalRecovered}}
    public var totalRecovered: String{get{_pTotalCases}}
    public var activeCases: String{get{_pActiveCases}}
    public var seriousCritical: String{get{_pSeriousCritical}}
    
    
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
