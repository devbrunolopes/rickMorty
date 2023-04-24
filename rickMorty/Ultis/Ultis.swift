//
//  Ultis.swift
//  rickMorty
//
//  Created by Franklin  Stilhano on 4/24/23.
//

import UIKit
import Security

class KeychainService {

    class func save(key: String, data: Data) -> Bool {
        let query = [
            kSecClass: kSecClassGenericPassword as AnyObject,
            kSecAttrAccount: key as AnyObject,
            kSecValueData: data as AnyObject
        ] as [CFString: AnyObject]

        SecItemDelete(query as CFDictionary)

        let status = SecItemAdd(query as CFDictionary, nil)

        return status == errSecSuccess
    }

    class func load(key: String) -> Data? {
        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key,
            kSecReturnData: kCFBooleanTrue,
            kSecMatchLimit: kSecMatchLimitOne
        ] as [CFString: Any]

        var dataTypeRef: AnyObject? = nil

        let status = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)

        if status == errSecSuccess {
            return dataTypeRef as? Data
        } else {
            return nil
        }
    }
}
