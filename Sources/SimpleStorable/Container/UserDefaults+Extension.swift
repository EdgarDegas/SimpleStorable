//
//  File.swift
//  
//
//  Created by iMoe Nya on 2021/12/6.
//

import Foundation

extension UserDefaults: CodablePersistentContainer {
    public static let containerEncoder = JSONEncoder()
    public static let containerDecoder = JSONDecoder()
    
    public func set<Value: Codable>(_ value: Value?, by key: String) {
        let encoded = try? Self.containerEncoder.encode(value)
        setValue(encoded, forKey: key)
    }
    
    public func value<Value: Codable>(by key: String) -> Value? {
        guard let encoded = value(forKey: key) as? Data else { return nil }
        return try? Self.containerDecoder.decode(Value.self, from: encoded)
    }
}
