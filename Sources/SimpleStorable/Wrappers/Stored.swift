import Foundation

/// Property wrapper to store a codable into `UserDefaults` by key.
///
/// You can access the wrapper itself by `$propertyName`.
@propertyWrapper public struct Stored<Value: Codable>: StoredWrapper {
    public let key: String
    
    public var cached: Value?
    public var container: CodablePersistentContainer = UserDefaults.standard

    public init(key: String) {
        self.key = key
    }
    
    public var wrappedValue: Value? {
        get {
            getWrappedValue()
        }
        set {
            setWrappedValue(newValue)
        }
    }
    
    public var projectedValue: Self {
        self
    }
}
