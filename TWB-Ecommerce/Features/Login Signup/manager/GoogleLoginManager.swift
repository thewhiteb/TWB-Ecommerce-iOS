//
//  GoogleLoginManager.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 05/09/2024.
//

import Foundation
import FirebaseCore
import FirebaseAuth
import GoogleSignIn

struct GoogleLoginManager {
    @MainActor
    func googleOauth() async throws -> (username: String, email: String) {
        // Google sign-in
        guard let clientID = FirebaseApp.app()?.options.clientID else {
            fatalError("No Firebase clientID found")
        }

        // Create Google Sign-In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        // Get rootViewController
        let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        guard let rootViewController = scene?.windows.first?.rootViewController else {
            fatalError("There is no root view controller!")
        }
        
        // Google sign-in authentication response
        let result = try await GIDSignIn.sharedInstance.signIn(
            withPresenting: rootViewController
        )
        let user = result.user
        guard let idToken = user.idToken?.tokenString else {
            throw AuthenticationError.runtimeError("Unexpected error occurred, please retry")
        }
        
        // Firebase auth
        let credential = GoogleAuthProvider.credential(
            withIDToken: idToken, accessToken: user.accessToken.tokenString
        )
        try await Auth.auth().signIn(with: credential)
        
        // Fetch user details
        guard let username = user.profile?.name, let email = user.profile?.email else {
            throw AuthenticationError.runtimeError("Failed to retrieve user details")
        }

        return (username: username, email: email)
    }
    
    func logout() async throws {
        GIDSignIn.sharedInstance.signOut()
        try Auth.auth().signOut()
    }
}

enum AuthenticationError: Error {
    case runtimeError(String)
}
