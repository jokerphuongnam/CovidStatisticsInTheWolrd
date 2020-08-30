import Foundation

public struct StatByCountry: Codable{
    public init(_ country: String?, _ latestStatByCountry: [LastedStat]?) {
        self._country = country
        self._latestStatByCountry = latestStatByCountry
    }
    
    private var _country: String?
    private var _latestStatByCountry: [LastedStat]?
    
    public var country: String? {get{_country}}
    public var latestStatByCountry: [LastedStat]? {get{_latestStatByCountry}}
    
    enum CodingKeys: String, CodingKey {
        case _country = "country"
        case _latestStatByCountry = "latest_stat_by_country"
    }
}
