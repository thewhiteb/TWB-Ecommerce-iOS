//
//  LoginView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 07/08/2024.
//

import SwiftUI


struct LoginView: View {
    @State private var phoneNumber: String = ""
    @ObservedObject var fbmanager = FBLoginManager()
    
    var body: some View {
        VStack{
            HStack{
                Image("cross")
                    .padding(.leading,16)
                    .padding(.top,20)
                Spacer()
            }
            
            HStack{
                Text("Welcome!")
                    .font(.custom("Baskerville", size: 38))
                    .fontWeight(.semibold)
                    .padding(.top, 50)
                    .padding(.leading,16)
                Spacer()
            }
            HStack{
                Text("Log in to your account to access joyful gifting.")
                    .font(.custom("Baskerville", size: 18))
                    .padding(.leading, 17)
                    .foregroundColor(Color(red: 0.46, green: 0.46, blue: 0.46))
                Spacer()
            }
            
            PhoneNumberField(phoneNumber: $phoneNumber)
                .frame(height: 60) // Set height to 60
                .frame(maxWidth: .infinity) // Make it span the full width
                .padding(.leading, 16)
                .padding(.trailing, 16)
                .padding(.top, 50) // Optional: Adjust top padding as needed
            
            SimpleButton(title: "Login", action: {
                
            })
            .padding(.top, 30)
            
            HStack{
                Rectangle()
                    .frame(height: 1)  // Adjust height as needed
                    .foregroundColor(Color(red: 0.85, green: 0.85, blue: 0.85))
                    .padding(.leading,16)
                
                // Text in the center
                Text("Or Continue with")
                    .font(.custom("Baskerville", size: 13))
                    .foregroundColor(Color(red: 0.46, green: 0.46, blue: 0.46))
                
                // Line on the right side
                Rectangle()
                    .frame(height: 1)  // Adjust height as needed
                    .foregroundColor(Color(red: 0.85, green: 0.85, blue: 0.85))
                    .padding(.trailing,16)
            }
            .padding(.top,50)
            
            HStack{
                SocialButton(imageName: "google_logo", action: {
                    
                })
                Spacer()
                SocialButton(imageName: "apple_logo", action: {
                    
                })
                Spacer()
                SocialButton(imageName: "facebook_logo", action: {
                    self.fbmanager.facebookLogin()
                })
                
            }
            .padding(.leading,16)
            .padding(.trailing,16)
            .padding(.top,30)
            
            Spacer()
            
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
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    LoginView()
}
