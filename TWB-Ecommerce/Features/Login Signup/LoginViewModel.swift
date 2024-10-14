//
//  LoginViewModel.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 14/10/2024.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var phoneNumber: String = ""
    @Published var err: String?
    
    
    
    private let loginRepository: LoginRepository
    
    init(loginRepository: LoginRepository = LoginRepositoryImplementation()) {
        self.loginRepository = loginRepository
    }
    
    func sendOtp() {
        if phoneNumber.isEmpty {
            self.err = "Phone number is required"
            return
        }
        
        let formattedPhoneNumber = "%2B971\(phoneNumber)"

        Task {
            let request = LoginRequest(
                name: nil,
                phoneNumber: formattedPhoneNumber,
                email: nil,
                otpTypeEnum: "Login",
                userTypeEnum: "Flower",
                sendOtpViaEnum: "PhoneNumber"  
            )
            
            let response = await loginRepository.sendOtp(request: request)
            
            // Switch back to the main thread when updating the UI
            DispatchQueue.main.async {
                if response.statusCode == 200 {
                    print("OTP Sent: \(String(describing: response.data))")
                } else {
                    self.err = response.messages.first ?? "Unknown error"
                }
            }
        }
    }
}
