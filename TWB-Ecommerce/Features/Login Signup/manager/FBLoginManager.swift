//
//  FBLoginManager.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 04/09/2024.
//

import FBSDKCoreKit
import FBSDKLoginKit

class FBLoginManager: ObservableObject {
    let loginManager = LoginManager()

    func facebookLogin() {
        loginManager.logIn(permissions: ["public_profile", "email"], from: nil) { [weak self] result, error in
            if let error = error {
                print("Login failed with error: \(error)")
            } else if let result = result, !result.isCancelled {
                if let token = result.token?.tokenString {
                    print("Logged in with token: \(token)")
                    self?.fetchUserProfile()
                }
            } else {
                print("Login cancelled")
            }
        }
    }

    private func fetchUserProfile() {
        let graphRequest = GraphRequest(graphPath: "me", parameters: ["fields": "id, name, email"])
        graphRequest.start { _, result, error in
            if let error = error {
                print("Failed to fetch user profile: \(error)")
            } else if let userProfile = result as? [String: Any] {
                let name = userProfile["name"] as? String ?? "No Name"
                let email = userProfile["email"] as? String ?? "No Email"
                print("User Name: \(name)")
                print("User Email: \(email)")
            }
        }
    }
}

