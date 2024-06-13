//
//  Note_App_iOSApp.swift
//  Note-App-iOS
//
//  Created by Dimas Aristyo Rahadian on 01/06/24.
//

import SwiftUI
import Wormholy

@main
struct Note_App_iOSApp: App {
    @StateObject private var authManager = AuthManager()
    
    init() {
        // Customize the navigation bar appearance
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.onPrimaryGreen
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        
        //Enable wormholy network log
        Wormholy.shakeEnabled = true
    }
    
    var body: some Scene {
        WindowGroup {
            RootView().environmentObject(authManager)
        }
    }
}
