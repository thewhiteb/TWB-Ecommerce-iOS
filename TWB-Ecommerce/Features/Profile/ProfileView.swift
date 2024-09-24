//
//  ProfileView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 09/09/2024.
//


import SwiftUI

struct ProfileView: View {
    let isUserLoggedIn: Bool = true
    var body: some View {
        VStack {
            profileView()
        }
        .safeAreaInset(edge: .top) {
            Color.clear.frame(height: 50)
        }
    }

    @ViewBuilder
    func loginView() -> some View {
        NavigationView {
            VStack {
                logoutProfileView()
            }
        }
    }

    @ViewBuilder
    func profileView(isLoggedIn: Bool = false) -> some View {
        if isLoggedIn {
            loginProfileView()
        } else {
            logoutProfileView()
        }
    }

    @ViewBuilder
    func logoutProfileView() -> some View {
        LogoutProfileView(onLogin: {
            
        }, onSignup: {
            NavigationLink(destination: LoginView()) {
                Text("Profile")
                    .font(.largeTitle)
                    .padding()
                    .foregroundColor(.blue) // Optional: Make the text look clickable
            }
        })
    }

    @ViewBuilder
    func loginProfileView() -> some View {
        VStack {
            
        }
    }
}
#Preview {
    ProfileView()
}
