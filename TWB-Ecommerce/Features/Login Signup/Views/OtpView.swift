//
//  OtpView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 12/09/2024.
//

import SwiftUI

struct OtpView: View {
    
    @StateObject private var viewModel = OTPViewModel()
    
    var phoneNumber: String
    @State private var timeRemaining = 10
    @State private var isTimerRunning = true
    @State private var isClickable = false
    @State private var isMoreOptionClicked = false
    
    var onBackButtonClick: () -> Void
    
    // Function to start the timer
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            } else {
                self.isTimerRunning = false
                self.isClickable = true // Enable click after timer ends
                timer.invalidate() // Stop the timer
            }
        }
    }
    
    var body: some View {
        
        VStack {
            VStack {
                HStack(spacing: 0) {
                    // Custom back button
                    Button(action: {
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        onBackButtonClick()
                    }) {
                        Image(systemName: "arrow.left")  // Use a system image for the back arrow
                            .foregroundColor(.black)  // Set the color of the back button
                            .font(.system(size: 22, weight: .semibold))  // Customize the size and weight of the icon
                    }
                    
                    Text("Confirm your number")
                        .font(.getFont(name: .libreBold , size: 16))
                        .foregroundColor(.black)
                        .fontWeight(.semibold)
                        .frame(width: 192, height: 18, alignment: .topLeading)
                        .padding(.leading, 12)
                    Spacer()
                    
                    // Skip button
                    SkipButton(action: {
                    })
                }
                .padding(.top, 100)
                
                HStack{
                    // Display phone number (Optional)
                    Text("Enter the code we've sent by text to \n\(phoneNumber)")
                        .font(.getFont(name: .libreRegular , size: 14))
                        .padding(.top, 50)
                    Spacer()
                }
                
                
                HStack{
                    OtpFieldView(verifyOTP: { value in
                        viewModel.otp = value
                        viewModel.verifyOTP(phoneNumber: phoneNumber)
                    })
                    Spacer()
                }
                .padding(.top,30)
                
                
                HStack{
                    // Text for resend OTP with timer
                    Button(action: {
                        if isClickable {
                            isMoreOptionClicked.toggle()
                        }
                    }) {
                        Text(isClickable ? "I didn't receive the code" : "I didn't receive the code in (\(formatTime(timeRemaining)))")
                            .font(.getFont(name: .libreRegular , size: 14))
                            .padding(.vertical,10)
                            .padding(.horizontal)
                            .background(isClickable ? Color.black : Color.gray.opacity(0.2)) // Change background when clickable
                            .foregroundColor(isClickable ? .white : .black) // Text color changes when clickable
                            .cornerRadius(25) // Capsule background
                    }
                    .disabled(!isClickable) // Disable button until it's clickable
                    
                    Spacer()
                }
                .padding(.top,30)
                
                Spacer()
                
                SimpleButton(title: "Continue", action: {
                    print("Hello")
                })
            }
            .padding(.horizontal, 16)
            .navigationBarBackButtonHidden(true)  // Hides the default back button
            .sheet(isPresented: $isMoreOptionClicked) {
                MoreOptions(phoneNumber: phoneNumber)
                    .presentationDetents([.fraction(0.8), .large])
            }
            .onAppear {
                startTimer() // Start the timer when the view appears
            }
        }
        .background(Color.white)
        .padding(.bottom, 50)
        
    }
    
    // Format the time to "mm:ss"
    private func formatTime(_ totalSeconds: Int) -> String {
        let minutes = totalSeconds / 60
        let seconds = totalSeconds % 60
        return String(format: "%d:%02d", minutes, seconds)
    }
}

#Preview {
    OtpView(phoneNumber: "123456789", onBackButtonClick: {
        
    })
}


