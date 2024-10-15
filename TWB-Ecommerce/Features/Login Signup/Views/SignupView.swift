//
//  SignupView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 12/09/2024.
//

//
//  LoginView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 07/08/2024.
//

import SwiftUI

struct SignupView: View {
    @Environment(\.presentationMode) var presentationMode  // To handle navigation back
    @State private var phoneNumber: String = ""
    @State private var err: String = " "
    @State private var navigateToOtp = false  // To control navigation to OtpView
    @State private var email: String = ""
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    
    // Managers for handling social logins
    @ObservedObject var fbManager = FBLoginManager()            // Facebook login manager
    @ObservedObject var googleManager = GoogleLoginManager()     // Google login manager
    @ObservedObject var appleManager = AppleSignInManager()      // Apple login manager
    
    var body: some View {
        NavigationStack {
            VStack(alignment:.leading) {
                // Top bar with cross icon
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()  // Go back to the previous view
                    }) {
                        Image("cross")
                            .resizable()
                            .frame(width: 24, height: 24) // Adjust the size of the cross image
                    }
                    .padding(.leading, 16)
                    .padding(.top, 20)
                    Spacer()
                }
                
                // Welcome text
                HStack {
                    Text("Sign Up")
                        .font(.custom("Baskerville", size: 38))
                        .fontWeight(.semibold)
                        .padding(.top, 50)
                        .padding(.leading, 16)
                    Spacer()
                }
                
                // Subheading text
                HStack {
                    Text("Sign up to access joyful gifting.")
                        .font(.custom("Baskerville", size: 18))
                        .padding(.leading, 17)
                        .foregroundColor(Color(red: 0.46, green: 0.46, blue: 0.46))
                    Spacer()
                }
                
                HStack(spacing :0){
                    SimpleTextField(text: $firstName, hint: "Frist Name")
                    Spacer()
                    SimpleTextField(text: $lastName, hint: "Last Name")
                }
                .padding(.top,50)
                .padding(.horizontal,15)
                
                // Phone number input field
                PhoneNumberField(phoneNumber: $phoneNumber)
                    .frame(height: 40) // Set height to 40
                    .frame(maxWidth: .infinity) // Make it span the full width
                    .padding(.leading, 16)
                    .padding(.trailing, 16)
                    .padding(.top, 20) // Optional: Adjust top padding as needed
                
                SimpleTextField(text: $email, hint: "Email")
                    .padding(.top,20)
                    .padding(.horizontal,15)
                
                
                // Show error message if the phone number is empty
                Text(err)
                    .foregroundColor(.red)
                    .font(.custom("Baskerville", size: 14))
                    .padding(.top, 8)
                    .padding(.leading,20)
                
                // Login button
                SimpleButton(title: "Sign Up", action: {
                    if phoneNumber.isEmpty {
                        // Show error if the phone number is empty
                        err = "Please enter your phone number"
                    } else {
                        navigateToOtp = true
                    }
                })
                .padding(.top, 0)
                
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
                .padding(.top, 30)
                
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
                
                // Option for creating a new account
                HStack {
                    Spacer()
                    Text("You have an account??")
                        .font(.custom("Baskerville", size: 14))
                        .foregroundColor(.gray)
                    
                    Button(action: {
                        // Action for creating an account
                    }) {
                        Text("Login")
                            .font(.custom("Baskerville", size: 14))
                            .fontWeight(.semibold)
                            .underline()
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                }
                .padding(.bottom, 50) // Adjust bottom padding as needed
            }
            .navigationDestination(isPresented: $navigateToOtp) {
                OtpView(phoneNumber: phoneNumber, onBackButtonClick: {
                    
                })  // Navigate and pass the phone number
            }
            .navigationBarBackButtonHidden(true) // Hide back button
            .onTapGesture {
                UIApplication.shared.hideKeyboard()  // Dismiss the keyboard when tapping outside
            }
        }
    }
}

#Preview {
    SignupView()
}

