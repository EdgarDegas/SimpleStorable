import Foundation

/// Property wrapper to store a codable into `UserDefaults` by key.
///
/// You can access the wrapper itself by `$propertyName`.
@propertyWrapper public struct StoredFlag<Value: Codable>: StoredWrapper {
    public let key: String
    
    public var cached: Value?
    public var container: CodablePersistentContainer = UserDefaults.standard
    public var defaultValue: Value

    public init(key: String, defaultValue: Value) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    public var wrappedValue: Value {
        get {
            getWrappedValue() ?? defaultValue
        }
        set {
            setWrappedValue(newValue)
        }
    }
    
    public var projectedValue: Self {
        self
    }
}
