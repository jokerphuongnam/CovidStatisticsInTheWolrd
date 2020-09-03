import XCTest
import RealmSwift
import PromiseKit
@testable import CovidStatisticsInTheWolrd

class CountryFlagsLocalTest: XCTestCase {
    var sut: CountryFlagsLocalProtocol! = nil
    var realm: Realm!
    
    override func setUp() {
        Realm.Configuration.defaultConfiguration.inMemoryIdentifier = self.name
        do{
            realm = try Realm()
        }catch{
            return
        }
        sut = CountryFlagsRealm(realm: realm)
    }
    
    override func tearDown() {
        sut = nil
        try! realm.write {
            realm.deleteAll()
        }
        realm = nil
    }
}
