import Foundation

/// Objects that can be used as a persistent container for storing `Codable` objects.
public protocol CodablePersistentContainer {
    /// Used by `CodablePersistentContainer`.
    static var containerEncoder: JSONEncoder { get }
    
    /// Used by `CodablePersistentContainer`.
    static var containerDecoder: JSONDecoder { get }
    
    /// Save a Swift Codable object into the container.
    func set<Value: Codable>(_ value: Value?, by key: String)
    
    /// Retrieve a Swift Codable object from the container. You have to provide the type.
    func value<Value: Codable>(by key: String) -> Value?
}
