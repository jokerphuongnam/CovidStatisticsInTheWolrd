import Foundation

public struct LastedStat : Codable{
    public init(_ totalCases: String,_ newases: String,_ totalDeaths: String,_ newDeaths: String,_ totalRecovered: String,_ activeCases: String, _ seriousCritical: String) {
        self._totalCases = totalCases
        self._newases = newases
        self._totalDeaths = totalDeaths
        self._newDeaths = newDeaths
        self._totalRecovered = totalRecovered
        self._activeCases = activeCases
        self._seriousCritical = seriousCritical
    }
    
    private var _totalCases: String
    private var _newases: String
    private var _totalDeaths: String
    private var _newDeaths: String
    private var _totalRecovered: String
    private var _activeCases: String
    private var _seriousCritical: String
    
    public var totalCases: String{get{_totalCases}}
    public var newases: String{get{_newases}}
    public var totalDeaths: String{get{_totalDeaths}}
    public var newDeaths: String{get{_totalRecovered}}
    public var totalRecovered: String{get{_totalCases}}
    public var activeCases: String{get{_activeCases}}
    public var seriousCritical: String{get{_seriousCritical}}
    
    
    enum CodingKeys: String, CodingKey {
        case _totalCases = "total_cases"
        case _newases = "new_cases"
        case _totalDeaths = "total_deaths"
        case _newDeaths = "new_deaths"
        case _totalRecovered = "total_recovered"
        case _activeCases = "active_cases"
        case _seriousCritical = "serious_critical"
    }
}
