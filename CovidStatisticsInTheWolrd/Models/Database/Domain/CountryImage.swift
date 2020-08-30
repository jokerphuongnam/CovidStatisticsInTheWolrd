import UIKit
import RealmSwift

class CountryImage: Object {
    init(countryCode: String, image: UIImage) {
        self._countryCode = countryCode
        self._image = image
    }
    
    required init() {
        self._countryCode = nil
        self._image = nil
    }
    
    private var _countryCode: String!
    private var _image: UIImage!
    
    public var countryCode: String{get{_countryCode}}
    
    public var image: UIImage{get{_image}}
}
