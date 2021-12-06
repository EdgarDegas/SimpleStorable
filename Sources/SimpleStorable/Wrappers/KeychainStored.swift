import Foundation
import KeychainAccess

@propertyWrapper public struct KeychainStored<Value: Codable>: StoredWrapper {
    public var container: CodablePersistentContainer = Keychain.default
    
    public var key: String
    
    public var cached: Value?
    
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
    
    public var projectedValue: KeychainStored<Value> { self }
}
