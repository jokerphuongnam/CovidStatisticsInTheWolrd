import XCTest
@testable import CovidStatisticsInTheWolrd

class CountryLocalCodeTest: XCTestCase {
    
    var sut: CountryCodeLocalProtocol!
    
    override func setUp() {
        sut = DefaultCountryCodeLocal()
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func test_getCountryCode_VietNam_equalvn(){
        let vietNam = "VietNam"
        var data: String? = nil
        let VietNamCode = "vn"
        
        do{
            data = try sut.getCountryCode(with: vietNam)
        }catch{
            XCTAssertThrowsError(try sut.getCountryCode(with: vietNam))
        }
        
        XCTAssertNotNil(data)
        XCTAssertEqual(data?.lowercaseAndTrimSpace, VietNamCode.lowercaseAndTrimSpace)
    }
    
    func test_fetchCountrysCodes_countryCodeNotNil(){
        var data: [String: String]
        
        XCTAssertNoThrow(try sut.fetchCountryCodes())
        
        data = sut.countryCodes
        
        XCTAssertNotNil(data)
    }
}
