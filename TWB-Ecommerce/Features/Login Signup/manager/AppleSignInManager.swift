//
//  AppleSignInManager.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 06/09/2024.
//

import AuthenticationServices
import SwiftUI

class AppleSignInManager: NSObject, ObservableObject, ASAuthorizationControllerDelegate {
    
    @Published var userInfo: (username: String, email: String)?
    @Published var errorMessage: String?

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
            let fullName = appleIDCredential.fullName?.givenName ?? "No Name"
            let email = appleIDCredential.email ?? "No Email"
            
            DispatchQueue.main.async {
                self.userInfo = (username: fullName, email: email)
            }
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        DispatchQueue.main.async {
            self.errorMessage = error.localizedDescription
        }
    }
}

