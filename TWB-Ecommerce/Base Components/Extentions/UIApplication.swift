//
//  UIApplication.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 12/09/2024.
//


import SwiftUI

// Extension to hide the keyboard
extension UIApplication {
    func hideKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
