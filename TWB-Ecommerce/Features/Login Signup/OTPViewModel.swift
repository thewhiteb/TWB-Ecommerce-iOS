//
//  OTPViewModel.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 15/10/2024.
//

import Foundation
import Combine

class OTPViewModel: ObservableObject {
    
    @Published var otp: String = ""
    @Published var err: String?
    @Published var timeRemaining: Int = 10
    @Published var count: Int = 0
    @Published var isTimerRunning: Bool = true
    @Published var isClickable: Bool = false
    @Published var isError: Bool = false
    @Published var isMoreOptionClicked: Bool = false
    
    private var timerCancellable: AnyCancellable?
    private let loginRepository: LoginRepository
    
    init(loginRepository: LoginRepository = LoginRepositoryImplementation()) {
        self.loginRepository = loginRepository
    }
    
    // Starts the OTP timer and updates the state accordingly
    func startTimer() {
        isClickable = false
        timeRemaining = 10
        isTimerRunning = true
        
        timerCancellable?.cancel()  // Cancel any existing timer
        
        timerCancellable = Timer.publish(every: 1.0, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self = self else { return }
                
                if self.timeRemaining > 0 {
                    self.timeRemaining -= 1
                } else {
                    self.isTimerRunning = false
                    self.isClickable = true
                    self.timerCancellable?.cancel()  // Stop the timer
                }
            }
    }
    
    // Verifies the OTP via the repository
    func verifyOTP(phoneNumber: String) {
        count += 1
        Task {
            let request = OTPVerifyRequest(
                phoneNumber: phoneNumber,
                email: nil,
                otp: otp,
                otpTypeEnum: "Login",
                sendOtpViaEnum: "PhoneNumber"
            )
            
            isError = false
            let response = await loginRepository.verifyOtp(request: request)
            
            // Switch back to the main thread when updating the UI
            DispatchQueue.main.async {
                if response.statusCode == 200 {
                    print("Message: \(String(describing: response.data?.message))")
                } else {
                    self.isError = true
                    self.err = response.messages.first ?? "Unknown error"
                    print("Error: \(self.err ?? "No error")")
                }
            }
        }
    }
    
    // Handles the more option click logic
    func toggleMoreOptions() {
        isMoreOptionClicked.toggle()
    }
    
    func stopTimer()
    {
        timerCancellable?.cancel()
    }
    // Helper to format time remaining
    func formatTime() -> String {
        let minutes = timeRemaining / 60
        let seconds = timeRemaining % 60
        return String(format: "%d:%02d", minutes, seconds)
    }
}
