//
//  LoginView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 07/08/2024.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var viewModel : LoginViewModel
    
//    @StateObject var viewModel : LoginViewModel = LoginViewModel()
    
    @State private var navigateToOtp = false  // To control navigation to OtpView
    @State private var navigateToSignup = false  // To control navigation to SignupView
    
    // Managers for handling social logins
    @ObservedObject var fbManager = FBLoginManager()            // Facebook login manager
    @ObservedObject var googleManager = GoogleLoginManager()     // Google login manager
    @ObservedObject var appleManager = AppleSignInManager()      // Apple login manager
    
    var onCrossClick : () -> Void
    var onLoginClick : (String) -> Void
    
    var body: some View {
       
            VStack(alignment:.leading) {
 
                ZStack{
                    HStack {
                        Image ("Close Button")
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.vertical)
                    
                    Text("Log In Or Sign Up")
                        .font(.getFont(name: .libreBold, size: 16))
                }
               
                
                Divider()
                    .frame(height: 1)
                    .foregroundColor(Constants.grayBorder)
                
                
                
                
                // Phone number input field
                PhoneNumberField(phoneNumber: $viewModel.phoneNumber)
                    .frame(height: 60) // Set height to 60
                    .frame(maxWidth: .infinity) // Make it span the full width
                    .padding(.leading, 16)
                    .padding(.trailing, 16)
                    .padding(.top, 30) // Optional: Adjust top padding as needed
                
                // Show error message if the phone number is empty
                if let error = viewModel.err{
                    Text(error)
                        .foregroundColor(.red)
                        .font(.custom("Baskerville", size: 14))
                        .padding(.top, 8)
                        .padding(.leading,20)
                }
                // Login button
                SimpleButton(title: "Login", action: {
                    if viewModel.phoneNumber.isEmpty {
                        // Show error if the phone number is empty
                        viewModel.err = "Please enter your phone number"
                    } else {
                        viewModel.sendOtp()
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        onLoginClick("+971\(viewModel.phoneNumber)")
                    }
                })
                .padding(.top, 12)
                
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
                
//                // Social login buttons (Google, Apple, Facebook)
//                HStack {
//                    SocialButton(imageName: "google_logo", action: {
//                        Task {
//                            await googleManager.googleOauth() // Call Google sign-in
//                        }
//                    })
//                    Spacer()
//                    SocialButton(imageName: "apple_logo", action: {
//                        appleManager.startSignInWithAppleFlow() // Call Apple sign-in
//                    })
//                    Spacer()
//                    SocialButton(imageName: "facebook_logo", action: {
//                        fbManager.facebookLogin() // Call Facebook sign-in
//                    })
//                }
//                .padding(.leading, 16)
//                .padding(.trailing, 16)
//                .padding(.top, 30)
                
                
                ZStack {
                    // Background rectangle with border
                    Rectangle()
                        .stroke(Color.gray, lineWidth: 1)
                        .fill(Constants.white)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)

                    HStack {
                        Image("apple_logo")
                            .frame(width: 24, height: 24)
                        Spacer()
                    }
                    .padding()
                    Text("Continue with Apple")
                        .foregroundColor(.black)
                        .font(.getFont(name: .libreRegular, size: 16))
                }
                .onTapGesture {
                    appleManager.startSignInWithAppleFlow()
                }
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .padding(.horizontal,16)
                .padding(.top,56)
                
                ZStack {
                    // Background rectangle with border
                    Rectangle()
                        .stroke(Color.gray, lineWidth: 1)
                        .fill(Constants.white)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)

                    HStack {
                        Image("google_logo")
                            .frame(width: 24, height: 24)
                        Spacer()
                    }
                    .padding()
                    Text("Continue with Google")
                        .foregroundColor(.black)
                        .font(.getFont(name: .libreRegular, size: 16))
                }
                .onTapGesture {
                    Task {
                        await googleManager.googleOauth() // Call Google sign-in
                    }
                }
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .padding(.horizontal,16)
                .padding(.top,12)
                
                
                ZStack {
                    // Background rectangle with border
                    Rectangle()
                        .stroke(Color.gray, lineWidth: 1)
                        .fill(Constants.white)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)

                    HStack {
                        Image("facebook_logo")
                            .frame(width: 24, height: 24)
                        Spacer()
                    }
                    .padding()
                    Text("Continue with Facebook")
                        .foregroundColor(.black)
                        .font(.getFont(name: .libreRegular, size: 16))
                }
                .onTapGesture {
                    fbManager.facebookLogin()
                }
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .padding(.horizontal,16)
                .padding(.top,12)
                
                Spacer()
                
            }
            .background(Color.white)
            .onTapGesture {
                UIApplication.shared.hideKeyboard()  // Dismiss the keyboard when tapping outside
            }
        
    }
}

#Preview {
    LoginView(onCrossClick : {
        
    }, onLoginClick: { value in
        
    })
}
