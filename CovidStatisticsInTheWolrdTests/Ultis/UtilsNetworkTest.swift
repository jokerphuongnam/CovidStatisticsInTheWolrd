import XCTest
import PromiseKit
import Network
@testable import CovidStatisticsInTheWolrd
import UIKit

class UtilsNetworkTest: XCTestCase {
    
    var sut: UtilsNetworkProtocol!
    
    override func setUp() {
        sut = DefaultUtilsNetwork(NWPathMonitor())
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func test_statusConnectedInternet_whenHaveConnectedInternet_true(){
        let expect = expectation(description: "testWorldTotolStat")
        var data: NWPath.Status? = nil
        
        firstly{
            sut!.statusConnectedInternet()
        }.done{ (status) in
            data = status
                expect.fulfill()
        }
        .catch { _ in
            data = nil
            expect.fulfill()
        }
        
        waitForExpectations(timeout: 10, handler: nil)
        
        XCTAssertNotNil(data)
        XCTAssertEqual(data, NWPath.Status.satisfied)
    }
    
    func test_statusConnectedInternet_whenDontHaveConnectedInternet_true(){
        let expect = expectation(description: "testWorldTotolStat")
        var data: NWPath.Status? = nil
        
        firstly{
            sut!.statusConnectedInternet()
        }.done{ (status) in
            data = status
                expect.fulfill()
        }
        .catch { _ in
            data = nil
            expect.fulfill()
        }
        
        waitForExpectations(timeout: 10, handler: nil)
        
        XCTAssertNotNil(data)
        XCTAssertEqual(data, NWPath.Status.unsatisfied)
    }
}
