import Foundation
import Swinject
import Network
import RealmSwift

//Container sẽ khởi tạo object ở protocol này
public protocol ContainerObjectProtocal {
    //hàm lấy object đã khởi tạo ra
    func resolve<T>() -> T
    //khởi tạo toàn bộ object (cần được gọi trong init)
    func createObject()
    
    //khởi tạo models
    func createModels()
    //-------------------------------
    //===============================
    //khởi tạo Database
    func createDatabase()
    //local
    func createLocals()
    //network
    func createNetworks()
    //===============================
    //khởi tạo Repository
    func createRepository()
    //khởi tạo Use Case
    func createUseCase()
    //-------------------------------
    //khởi tạo Viewmodels và ViewController của StatsticByCountry
    func createStatsticByCountry()
    //khởi tạo Viewmodels và ViewController của StatsticByWorld
    func createStatsticByWorld()
    //khởi tạo Viewmodels và ViewController của WorldTotalStat
    func createWorldTotalStat()
    //khởi tạo utils
    func createUtils()
    //yêu cầu khởi tạo rỗng
    init()
    
    //single tone
    static var instance: Self { get set }
}

public final class ContainerSwinject: ContainerObjectProtocal {
    public func createObject() {
        //khởi tạo models
        createModels()
        //khởi tạo Viewmodels và ViewController
        createStatsticByCountry()
        createStatsticByWorld()
        createWorldTotalStat()
    }
    
    public func createModels() {
        createDatabase()
        createRepository()
        createUseCase()
    }
    
    public func createDatabase() {
        
    }
    
    //khởi tạo Locals
    public func createLocals() {
        //init CountryCodeLocal
        container.register(CountryCodeLocalProtocol.self) { _ in DefaultCountryCodeLocal(encode: JSONEncoder(), decode: JSONDecoder())}.inObjectScope(ObjectScope.container)
        //init CountryFlagsLocal
        container.register(CountryFlagsLocalProtocol.self) { _ in CountryFlagsRealm(realm: self.resolve())}
        //init CoronaVirusMonitor
        container.register(CoronaVirusMonitorLocalProtocol.self) { _ in CoronaVirusMonitorRealm(realm: self.resolve())}
    }
    
    //khởi tạo Network
    public func createNetworks() {
        //init CoronaVirusMonitor
        container.register(CoronaVirusMonitorNetworkProtocol.self) { _ in CoronaVirusMonitorAlamofire()}.inObjectScope(ObjectScope.container)
        //init CountryFlagsNetwork
        container.register(CountryFlagsNetworkProtocol.self) { _ in DefaultCountryFlagsNetwork()}.inObjectScope(ObjectScope.container)
    }
    
    //khởi tạo repository
    public func createRepository() {
        
    }
    
    //khởi tạo use case
    public func createUseCase() {
        
    }
    
    //khởi tạo viewmodels và viewcontroller của StatsticByCountry
    public func createStatsticByCountry() {
        
    }
    
    //khởi tạo viewmodels và viewcontroller của StatsticByWorld
    public func createStatsticByWorld() {
        
    }
    
    //khởi tạo viewmodels và viewcontroller của WorldTotalStat
    public func createWorldTotalStat() {
        
    }
    
    public func createUtils() {
        //init UtilsNetwork
        container.register(UtilsNetworkProtocol.self) { _ in DefaultUtilsNetwork(NWPathMonitor())}.inObjectScope(ObjectScope.container)
        //init Realm
        container.register(Realm.self) { _ in try! Realm()}.inObjectScope(ObjectScope.container)
    }
    
    public static var instance: ContainerSwinject = ContainerSwinject()
    
    
    //Container đến từ Swinject
    private var container: Container = Container()
    
    //lấy object đã khởi tạo
    public func resolve<T>() -> T {
        return container.resolve(T.self)!
    }
    
    //khởi tạo rỗng và gọi createObject
    required public init() {
        createObject()
    }
}
