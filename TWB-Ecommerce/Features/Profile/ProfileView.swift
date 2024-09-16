//
//  ProfileView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 09/09/2024.
//


import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: LoginView()) {
                    Text("Profile")
                        .font(.largeTitle)
                        .padding()
                        .foregroundColor(.blue) // Optional: Make the text look clickable
                }
            }
        }
    }
}
#Preview {
    ProfileView()
}
