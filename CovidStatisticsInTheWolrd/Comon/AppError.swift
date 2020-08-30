import Foundation

//Custom Error
enum AppError: Error{
    case urlNil
    case dataNil
    case cannotCreateThread(mess: String)
    case cannotConnectedInternet(mess: String)
    case objNil
    case cannotOpenAsset(mess: String)
}

//Lỗi của Realm
enum RealmError: Error{
    case cannotOpenWrite
}
