//
//  Environment.swift
//  MVVM
//
//  Created by Ильдар Аглиуллов on 20.02.2023.
//

import Foundation

struct Environment {
    
    static func getValue(forKey key: Variable) -> String {
        return infoForKey(key.rawValue)
    }
    
    private static func infoForKey(_ key: String) -> String {
        guard let value = (Bundle.main.infoDictionary?[key] as? String) else { fatalError("Could not get value for key: \(key)")}
        return value.replacingOccurrences(of: "\\", with: "")
    }
}

extension Environment {
    
    enum Variable: String {
        case appName = "APP_NAME"
        case appBundleID = "APP_BUNDLE_ID"
    }
}
