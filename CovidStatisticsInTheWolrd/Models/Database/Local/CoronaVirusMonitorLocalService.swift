import Foundation
import PromiseKit
import RealmSwift

//đọc và ghi dưới Local
public protocol CoronaVirusMonitorLocalProtocol{
    //lấy thống kê theo quốc gia từ Local
    func getStatByCountry(with countryCode: String) -> Promise<StatByCountry?>
    //thêm thống kê theo quốc gia xuống Local
    func addStatByCountry(_ statByCountry: StatByCountry) throws
    //lấy thống kê của thế giới từ Local
    func getWorldTotalStat() -> Promise<LastedStat?>
    //thêm thống kê của thế giới xuống Local
    func addWorldTotalStat(_ worldTotalStat: LastedStat) throws
}

//đoc và ghi ở Realm
public final class CoronaVirusMonitorRealm : CoronaVirusMonitorLocalProtocol {
    
    public init(realm: Realm){
        self.realm = realm
    }
    
    private var realm: Realm
    
    //lấy thống kê theo quốc gia từ Realm
    public func getStatByCountry(with countryCode: String) -> Promise<StatByCountry?> {
        return Promise<StatByCountry?>{ resolver in
            resolver.fulfill(realm.objects(StatByCountry.self).filter("_pCountry == \(countryCode.lowercaseAndTrimSpace)").first)
        }
    }
    
    //thêm thông kê theo quốc gia xuống Realm
    public func addStatByCountry(_ statByCountry: StatByCountry) throws {
        do {
            try realm.write{
                statByCountry.latestStatByCountry?.first?.key = statByCountry.country?.lowercaseAndTrimSpace
                realm.add(statByCountry)
            }
        }catch {
            throw error
        }
    }
    
    //lấy thống kê của thế giới từ Realm
    public func getWorldTotalStat() -> Promise<LastedStat?> {
        return Promise<LastedStat?> { resolver in
            resolver.fulfill(realm.objects(LastedStat.self).filter("_key == world").first)
        }
    }
    
    //lưu thống kê của thế giới xuống Realm
    public func addWorldTotalStat(_ worldTotalStat: LastedStat) throws {
        do {
            try realm.write{
                worldTotalStat.key = "world"
                realm.add(worldTotalStat)
            }
        }catch {
            throw error
        }
    }
}
