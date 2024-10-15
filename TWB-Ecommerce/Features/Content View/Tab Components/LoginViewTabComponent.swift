//
//  LoginViewTabComponent.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 14/10/2024.
//

import SwiftUI

struct LoginViewTabComponent: View {
    
    var onCrossClick :  () -> Void
    var onVerifyNumber : (String) -> Void
    
    var body: some View {
        LoginView(onCrossClick: onCrossClick, onLoginClick: { value in
            onVerifyNumber(value)
        })
    }
}

