//
//  RootView.swift
//  Note-App-iOS
//
//  Created by Dimas Aristyo Rahadian on 14/06/24.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var authManager: AuthManager
    
    var body: some View {
        Group {
            if authManager.isAuthenticated {
                NotesListView(vm: NotesListViewModel())
            } else {
                LandingView()
            }
        }
    }
}

