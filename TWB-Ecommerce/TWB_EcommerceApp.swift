//
//  TWB_EcommerceApp.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 06/08/2024.
//

import SwiftUI

@main
struct TWB_EcommerceApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            SplashView()
        }
    }
}
