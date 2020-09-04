import UIKit
import RealmSwift

public final class CountryImage: Object {
    public init(countryCode: String, image: UIImage) {
        self._pCountryCode = countryCode
        self._pImage = image
    }
    
    public required init() {
        super.init()
    }
    
    public override class func primaryKey() -> String? {
        return "_pCountryCode"
    }
    
    @objc dynamic private var _pCountryCode: String!
    @objc dynamic private var _pImage: UIImage!
    
    public var countryCode: String?{get{_pCountryCode}}
    public var image: UIImage?{get{_pImage}}
}
