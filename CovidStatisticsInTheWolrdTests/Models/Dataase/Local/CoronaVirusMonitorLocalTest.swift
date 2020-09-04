import XCTest
import RealmSwift
import PromiseKit
@testable import CovidStatisticsInTheWolrd

class CoronaVirusMonitorLocalTest: XCTestCase {
    
    var sut: CoronaVirusMonitorLocalProtocol!
    var realm: Realm!
    
    override func setUp() {
        realm = CreateRealmTest.realm(name: self.name)
    }

    override func tearDown() {
        try! realm.write {
            realm.deleteAll()
        }
        realm = nil
        sut = nil
    }
}
