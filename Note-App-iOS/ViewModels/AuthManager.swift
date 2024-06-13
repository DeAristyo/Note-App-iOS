//
//  AuthManager.swift
//  Note-App-iOS
//
//  Created by Dimas Aristyo Rahadian on 14/06/24.
//

import SwiftUI
import Combine

class AuthManager: ObservableObject {
    @Published var isAuthenticated: Bool = false
    @Published var baseURL: String = ""
    
    init() {
        loadBaseURL()
    }
    
    func loadBaseURL() {
        if let storedBaseURL = UserDefaults.standard.string(forKey: "baseURL"), !storedBaseURL.isEmpty {
            baseURL = storedBaseURL
            isAuthenticated = true
        } else {
            isAuthenticated = false
        }
    }
    
    func saveBaseURL(_ url: String) {
        baseURL = url
        UserDefaults.standard.set(url, forKey: "baseURL")
        isAuthenticated = true
    }
    
    func useDefaultBaseURL() {
        saveBaseURL("http://localhost:3000")
    }
}
