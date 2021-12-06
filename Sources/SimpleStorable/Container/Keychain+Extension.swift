import Foundation
import KeychainAccess


extension Keychain {
    static let `default`: Keychain = {
        Keychain(service: "SimpleStorable.Keychain")
    }()
}

extension Keychain: CodablePersistentContainer {
    public static let containerEncoder = JSONEncoder()
    public static let containerDecoder = JSONDecoder()
    
    public func set<Value: Codable>(_ value: Value?, by key: String) {
        if let value = value,
           let encoded = try? Self.containerEncoder.encode(value)
        {
            try? set(encoded, key: key)
        } else {
            self[key] = nil
        }
    }
    
    public func value<Value: Codable>(by key: String) -> Value? {
        guard let encoded = try? getData(key) else { return nil }
        return try? Self.containerDecoder.decode(Value.self, from: encoded)
    }
}
