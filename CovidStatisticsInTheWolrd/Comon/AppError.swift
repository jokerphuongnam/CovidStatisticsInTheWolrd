import Foundation

//Custom Error
public enum AppError: Error{
    case urlNil
    case dataNil
    case cannotCreateThread(mess: String)
    case cannotConnectedInternet(mess: String)
    case objNil
    case cannotOpenAsset(mess: String)
}

//Lỗi của Realm
public enum RealmError: Error{
    case cannotOpenWrite
}
