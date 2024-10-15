//
//  OTPViewModel.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 15/10/2024.
//

import Foundation

class OTPViewModel : ObservableObject {
    
    @Published var otp: String = ""
    @Published var err: String?
    
    private let loginRepository: LoginRepository
    
    init(loginRepository: LoginRepository  = LoginRepositoryImplementation()) {
        self.loginRepository = loginRepository
    }
    
    func verifyOTP(phoneNumber: String) {
        Task {
            let request = OTPVerifyRequest(
                phoneNumber: phoneNumber,
                email: nil,
                otp : otp,
                otpTypeEnum: "Login",
                sendOtpViaEnum: "PhoneNumber"
            )
            
            let response = await loginRepository.verifyOtp(request: request)
            
            // Switch back to the main thread when updating the UI
            DispatchQueue.main.async {
                if response.statusCode == 200 {
                    print("Message: \(String(describing: response.data?.message))")
                } else {
                    self.err = response.messages.first ?? "Unknown error"
                    print("Error : \(self.err ?? "No error")")

                }
            }
        }
    }
}
