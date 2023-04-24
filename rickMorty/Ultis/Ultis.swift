//
//  Ultis.swift
//  rickMorty
//
//  Created by Franklin  Stilhano on 4/24/23.
//

import Foundation

class Utils {
    
    static func saveUserDefaults(value: Any, key: String) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    static func removeUserDefaults(key: String) {
        UserDefaults.standard.removeObject(forKey: key)
    }
    
    static func getUserDefaults(key: String) -> Any? {
        let value = UserDefaults.standard.object(forKey: key)
        return value
    }
}
