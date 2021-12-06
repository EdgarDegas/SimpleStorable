import Foundation

/// Protocol of the `Stored` and `KeychainStored` wrappers.
public protocol StoredWrapper {
    associatedtype Value: Codable
    associatedtype WrappedValue: Codable
    var container: CodablePersistentContainer { get }
    
    var key: String { get }
    
    /// Cache the value so that we won't have to access disk all the time.
    var cached: Value? { get set }
    
    var wrappedValue: WrappedValue { get set }
    
    var projectedValue: Self { get }
}

public extension StoredWrapper {
    // This extension implementation doesn't seem to work.
    var projectedValue: Self { self }
    
    func getWrappedValue() -> Value? {
        if let cached = cached {
            return cached
        } else {
            let retrieved: Value? = container.value(by: key)
            return retrieved
        }
    }
    
    mutating func setWrappedValue(_ newValue: Value?) {
        cached = newValue
        container.set(newValue, by: key)
    }
}
