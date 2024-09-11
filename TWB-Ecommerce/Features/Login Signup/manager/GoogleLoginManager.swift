//
//  GoogleLoginManager.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 05/09/2024.
//

import FirebaseCore
import FirebaseAuth
import GoogleSignIn
import SwiftUI

class GoogleLoginManager: ObservableObject {
    @Published var userInfo: (username: String, email: String)?
    @Published var errorMessage: String?

    @MainActor
    func googleOauth() async {
        do {
            guard let clientID = FirebaseApp.app()?.options.clientID else {
                fatalError("No Firebase clientID found")
            }
            
            let config = GIDConfiguration(clientID: clientID)
            GIDSignIn.sharedInstance.configuration = config
            
            let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            guard let rootViewController = scene?.windows.first?.rootViewController else {
                fatalError("There is no root view controller!")
            }
            
            let result = try await GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController)
            let user = result.user
            
            guard let idToken = user.idToken?.tokenString else {
                throw AuthenticationError.runtimeError("Unexpected error occurred, please retry")
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: user.accessToken.tokenString)
            try await Auth.auth().signIn(with: credential)
            
            guard let username = user.profile?.name, let email = user.profile?.email else {
                throw AuthenticationError.runtimeError("Failed to retrieve user details")
            }
            
            DispatchQueue.main.async {
                self.userInfo = (username: username, email: email)
            }
        } catch {
            DispatchQueue.main.async {
                self.errorMessage = error.localizedDescription
            }
        }
    }
}


enum AuthenticationError: Error {
    case runtimeError(String)
}
