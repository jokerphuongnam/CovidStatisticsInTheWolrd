import UIKit
import RealmSwift

public final class CountryImage: Object {
    public init(countryCode: String, image: UIImage) {
        self._pCountryCode = countryCode
        self._pImage = image
    }
    
    public required init() {
        self._pCountryCode = nil
        self._pImage = nil
    }
    
    private var _pCountryCode: String!
    private var _pImage: UIImage!
    
    public var countryCode: String{get{_pCountryCode}}
    
    public var image: UIImage{get{_pImage}}
}
