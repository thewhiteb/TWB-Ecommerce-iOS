//
//  AppleSignInManager.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 06/09/2024.
//

import AuthenticationServices

class AppleSignInManager: NSObject, ASAuthorizationControllerDelegate {
    
    static let shared = AppleSignInManager()
    
    // Function to initiate Sign in with Apple
    func startSignInWithAppleFlow() {
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.performRequests()
    }
    
    // MARK: - ASAuthorizationControllerDelegate
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            let userIdentifier = appleIDCredential.user
            let fullName = appleIDCredential.fullName
            let email = appleIDCredential.email
            
            // Handle successful login here
            print("Apple Sign-In Successful!")
            print("User ID: \(userIdentifier)")
            print("Full Name: \(String(describing: fullName))")
            print("Email: \(String(describing: email))")
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        // Handle error in sign-in process
        print("Apple Sign-In Failed: \(error.localizedDescription)")
    }
}

