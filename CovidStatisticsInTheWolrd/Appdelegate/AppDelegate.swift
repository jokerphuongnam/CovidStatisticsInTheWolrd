import UIKit
import Swinject
import Network
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    //Container from Swinject
    private lazy var _container: Container = {
        let container: Container = Container()
        //init UtilsNetwork
        container.register(UtilsNetworkProtocol.self) { _ in DefaultUtilsNetwork(NWPathMonitor())}.inObjectScope(ObjectScope.container)
        //init CoronaVirusMonitor
        container.register(CoronaVirusMonitorNetworkProtocol.self) { _ in CoronaVirusMonitorAlamofire(utils: self.resolve())}.inObjectScope(ObjectScope.container)
        //init CountryFlagsNetwork
        container.register(CountryFlagsNetworkProtocol.self) { _ in DefaultCountryFlagsNetwork(utils: self.resolve())}.inObjectScope(ObjectScope.container)
        //init CountryCodeLocal
        container.register(CountryCodeLocalProtocol.self) { _ in DefaultCountryCodeLocal()}.inObjectScope(ObjectScope.container)
        //init Realm
        container.register(Realm.self) { _ in try! Realm()}
        //init CountryFlagsLocal
        container.register(CountryFlagsLocalProtocol.self) { _ in CountryFlagsRealm(realm: self.resolve())}
        return container
    }()
    
    private func resolve<T>() -> T {
        _container.resolve(T.self)!
    }
    
    public var container: Container {get{_container}}
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        
    }
}
