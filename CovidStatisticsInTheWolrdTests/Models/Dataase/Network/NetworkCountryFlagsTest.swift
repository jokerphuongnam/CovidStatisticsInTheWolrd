import XCTest
import PromiseKit
import Network
@testable import CovidStatisticsInTheWolrd

class NetworkCountryFlagsTest: XCTestCase {
    
    var sut: CountryFlagsNetworkProtocol!
    
    override func setUp() {
        sut = DefaultCountryFlagsNetwork()
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func test_fetchCountryFlag_vn_256_192_notNil(){
        let countryCode = "vn"
        let expect = expectation(description: "testWorldTotolStat")
        var data: UIImage? = nil
        
        firstly{
            sut!.fetchCountryFlag(with: countryCode, have: 256, and: 192)
        }.done {
            data = $0
            expect.fulfill()
        }.catch { _ in
            data = nil
            expect.fulfill()
        }
        
        waitForExpectations(timeout: 10, handler: nil)
        
        XCTAssertNotNil(data)
    }
}
