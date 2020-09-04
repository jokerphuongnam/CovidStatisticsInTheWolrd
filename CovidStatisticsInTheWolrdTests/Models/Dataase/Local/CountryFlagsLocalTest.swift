import XCTest
import RealmSwift
import PromiseKit
@testable import CovidStatisticsInTheWolrd

class CountryFlagsLocalTest: XCTestCase {
    
    var sut: CountryFlagsLocalProtocol! = nil
    var realm: Realm!
    
    override func setUp() {
        realm = CreateRealmTest.realm(name: self.name)
        sut = CountryFlagsRealm(realm: realm)
    }
    
    override func tearDown() {
        sut = nil
        realm = nil
    }
    
    func test_addFlag_noThrowError(){
        let countryCode = "VN"
        let image = UIImage()
        
        XCTAssertThrowsError(try sut.addFlag(with: countryCode, then: image))
    }
}
