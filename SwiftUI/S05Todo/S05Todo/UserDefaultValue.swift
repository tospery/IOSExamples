//
//  UserDefaultValue.swift
//  S05Todo
//
//  Created by 杨建祥 on 2024/6/1.
//

import Foundation

@propertyWrapper
struct UserDefaultValue<Value: Codable> {

    let key: String
    let defaultValue: Value

    var wrappedValue: Value {
        get {
            let data = UserDefaults.standard.data(forKey: key)
            let value = data.flatMap { try? JSONDecoder().decode(Value.self, from: $0) }
            return value ?? defaultValue
        }
        set {
            let data = try? JSONEncoder().encode(newValue)
            UserDefaults.standard.set(data, forKey: key)
        }
    }
}
