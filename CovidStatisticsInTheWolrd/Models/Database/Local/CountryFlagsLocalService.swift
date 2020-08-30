import Foundation
import PromiseKit
import RealmSwift

protocol CountryFlagsLocalProtocol {
    //lưu dữ liệu xuống local làm cache
    func addFlag(with countryCode: String,then image: UIImage) throws
    //lấy dữ liệu từ local lên
    func getFlag(with countryCode: String) -> Promise<UIImage?>
}

class CountryFlagsRealm: CountryFlagsLocalProtocol{
    private let realm: Realm
    
    init(realm : Realm) {
        self.realm = realm
    }
    
    //lưu dữ liệu xuống Realm làm cache
    func addFlag(with countryCode: String, then image: UIImage) throws {
        do {
            try realm.write {
                realm.add(CountryImage(countryCode: countryCode, image: image))
            }
        }catch{
            throw RealmError.cannotOpenWrite
        }
    }
    
    //lấy dữ liệu từ Realm lên
    func getFlag(with countryCode: String) -> Promise<UIImage?> {
        Promise<UIImage?>{ resolver in
            //tạo luồng khác để lấy dữ liệu
            DispatchQueue.global(qos: .utility).async {
                //query dữ liệu nếu tìm không thấy thì first nil, thấy thì mảng chỉ có 1 phần tử
                guard let image = self.realm.objects(CountryImage.self).filter("_countryCode == \(countryCode)").first else {
                    resolver.fulfill(nil)
                    return
                }
                //tìm ra thì chỉ có 1 phần tử
                resolver.fulfill(image.image)
            }
        }
    }
}
