//
//  LandingView.swift
//  Note-App-iOS
//
//  Created by Dimas Aristyo Rahadian on 12/06/24.
//

import SwiftUI

struct LandingView: View {
    @EnvironmentObject var authManager: AuthManager
    @State private var baseURL: String = ""
    
    var body: some View {
        ZStack{
            Color.onBackgroundWhite.opacity(0.5).ignoresSafeArea()
            VStack {
                Text("Welcome to note app")
                    .font(.system(size: 32, weight: .semibold))
                    .padding(.bottom, 4)
                
                Text("Please input your API base URL to continue")
                    .font(.system(size: 14, weight: .semibold))
                
                TextField("", text: $baseURL)
                    .placeholder(when: baseURL.isEmpty) {
                            Text("\("http://localhost:3000")").foregroundColor(.gray)
                    }
                    .padding()
                    .font(.system(size: 20, weight: .semibold))
                    .background(Color.white)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 2) 
                    )
                    .padding()
                
                Button(action: {
                    authManager.saveBaseURL(baseURL)
                }) {
                    Text("Save URL")
                        .bold()
                }
                .buttonStyle(RoundedButtonStyle(color: Color.onPrimaryGreen, width: 250))
                .padding()
                
                Text("OR")
                    .bold()
                
                Button(action: {
                    authManager.useDefaultBaseURL()
                }) {
                    Text("Use default URL")
                        .bold()
                }
                .buttonStyle(RoundedButtonStyle(color: Color.onPrimaryGreen, width: 250))
                .padding()
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    LandingView()
}

