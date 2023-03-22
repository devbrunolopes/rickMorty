//
//  Utils.swift
//  rickMorty
//
//  Created by Franklin  Stilhano on 3/20/23.
//

import Foundation

class Utils {
    static func saveUserDefaults(value: Any, key: String){
        UserDefaults.standard.set(value, forKey: key)
    }
    
    static func removeUserDefaults(key: String) {
        UserDefaults.standard.removeObject(forKey: key)
    }
    
    static func getUserDefault(key: String) -> Any? {
        return UserDefaults.standard.object(forKey: key)
    }
}
