import Foundation

public final class LiveData<T> {
    public init(_ value: T, _ handler: LiveData<T>.Handler?) {
        self._value = value
        self._handler = handler
    }
    
    public init(_ value: T) {
        self._value = value
        self._handler = nil
    }
    
    public typealias Handler = (T)->Void
    private var _value: T
    private var _handler: Handler?
    
    public var value: T{
        get{_value}
        set{_value = newValue}
    }
    
    public func bind(delegate handler: Handler?){
        self._handler = handler
    }
    
    //Đẩy dữ liệu vào LiveData bằng luồng khác luồng main
    public func postValue(_ value: T){
        DispatchQueue.global(qos: .utility).async {
            self._value = value
        }
    }
}
