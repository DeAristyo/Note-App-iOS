//
//  UserDefaultExtension.swift
//  Note-App-iOS
//
//  Created by Dimas Aristyo Rahadian on 12/06/24.
//

import Foundation

extension UserDefaults {
    private enum Keys {
        static let baseURL = "baseURL"
    }
    
    var baseURL: String {
        get {
            return string(forKey: Keys.baseURL) ?? ""
        }
        set {
            set(newValue, forKey: Keys.baseURL)
        }
    }
}
