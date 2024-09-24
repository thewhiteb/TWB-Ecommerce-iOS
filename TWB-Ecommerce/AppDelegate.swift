//
//  AppDelegate.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 04/09/2024.
//

import UIKit
import FirebaseCore
import FBSDKCoreKit
import GoogleSignIn


class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        // Firebase initialization
        FirebaseApp.configure()
        
        // Facebook SDK initialization
        ApplicationDelegate.shared.application(
            application,
            didFinishLaunchingWithOptions: launchOptions
        )

        return true
    }

    func application(
        _ app: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey : Any] = [:]
    ) -> Bool {
        // Facebook URL handling
        let handledByFacebook = ApplicationDelegate.shared.application(
            app,
            open: url,
            sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
            annotation: options[UIApplication.OpenURLOptionsKey.annotation]
        )
        
        // Google Sign-In URL handling
        let handledByGoogle = GIDSignIn.sharedInstance.handle(url)

        return handledByFacebook || handledByGoogle
    }
}
