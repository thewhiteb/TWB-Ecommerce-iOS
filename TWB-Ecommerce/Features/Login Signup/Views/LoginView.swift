//
//  LoginView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 07/08/2024.
//

import SwiftUI

struct LoginView: View {
    @State private var phoneNumber: String = ""
    @State private var err: String = ""
    
    // Managers for handling social logins
    @ObservedObject var fbManager = FBLoginManager()            // Facebook login manager
    @ObservedObject var googleManager = GoogleLoginManager()     // Google login manager
    @ObservedObject var appleManager = AppleSignInManager()      // Apple login manager
    
    @State private var userInfo: (username: String, email: String)?

    var body: some View {
        VStack {
            // Top bar with cross icon
            HStack {
                Image("cross")
                    .padding(.leading, 16)
                    .padding(.top, 20)
                Spacer()
            }

            // Welcome text
            HStack {
                Text("Welcome!")
                    .font(.custom("Baskerville", size: 38))
                    .fontWeight(.semibold)
                    .padding(.top, 50)
                    .padding(.leading, 16)
                Spacer()
            }

            // Subheading text
            HStack {
                Text("Log in to your account to access joyful gifting.")
                    .font(.custom("Baskerville", size: 18))
                    .padding(.leading, 17)
                    .foregroundColor(Color(red: 0.46, green: 0.46, blue: 0.46))
                Spacer()
            }

            // Phone number input field
            PhoneNumberField(phoneNumber: $phoneNumber)
                .frame(height: 60) // Set height to 60
                .frame(maxWidth: .infinity) // Make it span the full width
                .padding(.leading, 16)
                .padding(.trailing, 16)
                .padding(.top, 50) // Optional: Adjust top padding as needed

            // Login button
            SimpleButton(title: "Login", action: {
                // Handle phone number login action
            })
            .padding(.top, 30)

            // Divider line with text "Or Continue with"
            HStack {
                Rectangle()
                    .frame(height: 1)  // Adjust height as needed
                    .foregroundColor(Color(red: 0.85, green: 0.85, blue: 0.85))
                    .padding(.leading, 16)
                
                Text("Or Continue with")
                    .font(.custom("Baskerville", size: 13))
                    .foregroundColor(Color(red: 0.46, green: 0.46, blue: 0.46))
                
                Rectangle()
                    .frame(height: 1)  // Adjust height as needed
                    .foregroundColor(Color(red: 0.85, green: 0.85, blue: 0.85))
                    .padding(.trailing, 16)
            }
            .padding(.top, 50)

            // Social login buttons (Google, Apple, Facebook)
            HStack {
                SocialButton(imageName: "google_logo", action: {
                    Task {
                        await googleManager.googleOauth() // Call Google sign-in
                    }
                })
                Spacer()
                SocialButton(imageName: "apple_logo", action: {
                    appleManager.startSignInWithAppleFlow() // Call Apple sign-in
                })
                Spacer()
                SocialButton(imageName: "facebook_logo", action: {
                    fbManager.facebookLogin() // Call Facebook sign-in
                })
            }
            .padding(.leading, 16)
            .padding(.trailing, 16)
            .padding(.top, 30)

            Spacer()

            // Displaying user info or errors after login attempts
            if let userInfo = googleManager.userInfo {
                Text("Google User: \(userInfo.username), Email: \(userInfo.email)")
            }
            
            if let userInfo = appleManager.userInfo {
                Text("Apple User: \(userInfo.username), Email: \(userInfo.email)")
            }

            if let error = googleManager.errorMessage {
                Text("Google Sign-In Error: \(error)").foregroundColor(.red)
            }

            if let error = appleManager.errorMessage {
                Text("Apple Sign-In Error: \(error)").foregroundColor(.red)
            }

            // Option for creating a new account
            HStack {
                Text("Don't have an account?")
                    .font(.custom("Baskerville", size: 14))
                    .foregroundColor(.gray)
                
                Button(action: {
                    // Action for creating an account
                }) {
                    Text("Create one")
                        .font(.custom("Baskerville", size: 14))
                        .fontWeight(.bold)
                        .underline()
                        .foregroundColor(.black)
                }
            }
            .padding(.bottom, 20) // Adjust bottom padding as needed
        }
        .navigationBarBackButtonHidden(true) // Hide back button
    }
}

#Preview {
    LoginView()
}
