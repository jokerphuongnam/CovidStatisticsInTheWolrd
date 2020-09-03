import XCTest
import PromiseKit
import Network
@testable import CovidStatisticsInTheWolrd

class NetworkCoronaVirusMonitorTest: XCTestCase {
    
    var sut: CoronaVirusMonitorNetworkProtocol? = nil
    
    override func setUp() {
        sut = CoronaVirusMonitorAlamofire()
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func test_fetchWorldTotalStat_WhenHaveInternet_lastedStatNotNil(){
        let expect = expectation(description: "testWorldTotolStat")
        var data: LastedStat? = nil
        
        let _ = firstly{
            sut!.fetchWorldTotalStat()
        }.done{
            data = $0
            expect.fulfill()
        }.catch { _ in
            data = nil
            expect.fulfill()
        }
        
        waitForExpectations(timeout: 10, handler: nil)
        
        XCTAssertNotNil(data)
    }
    
    func test_fetchStatByCountry_VietNam_WhenHaveInternet_statByCountryNotNil(){
        let vietNam = "VietNam"
        let expect = expectation(description: "testtatByCountry")
        var data: StatByCountry? = nil
        
        let _ = firstly{
            sut!.fetchStatByCountry(with: vietNam)
        }.done {
            data = $0
            expect.fulfill()
        }.catch { (error) in
            data = nil
            expect.fulfill()
        }
        
        waitForExpectations(timeout: 10, handler: nil)
        
        XCTAssertNotNil(data)
    }
}
