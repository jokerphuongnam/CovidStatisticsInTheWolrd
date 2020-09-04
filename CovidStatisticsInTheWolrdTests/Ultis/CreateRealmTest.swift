import Foundation
import RealmSwift

class CreateRealmTest {
    class func realm(name: String) -> Realm{
        //tạo inMemory để test
        Realm.Configuration.defaultConfiguration.inMemoryIdentifier = name
        return try! Realm()
    }
}
