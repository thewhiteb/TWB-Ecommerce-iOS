//
//  OtpView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 12/09/2024.
//

import SwiftUI

struct OtpView: View {
    @Environment(\.presentationMode) var presentationMode  // Environment variable to handle back navigation
    var phoneNumber: String  // This will receive the phone number from LoginView
    @State private var isOtpVerified: Bool = false
    @State private var timeRemaining = 10 // 1 minute countdown
    @State private var isTimerRunning = true // Control the timer running state
    @State private var isClickable = false // Control whether the text is clickable or not
    @State private var isMoreOptionClicked = false
    
    
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
            HStack(spacing: 0) {
                // Custom back button
                Button(action: {
                    presentationMode.wrappedValue.dismiss()  // Move back to the previous view
                }) {
                    Image(systemName: "arrow.left")  // Use a system image for the back arrow
                        .foregroundColor(.black)  // Set the color of the back button
                        .font(.system(size: 22, weight: .semibold))  // Customize the size and weight of the icon
                }
                
                Text("Confirm your number")
                    .font(Font.custom("Baskerville", size: 18))
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
                    .frame(width: 192, height: 18, alignment: .topLeading)
                    .padding(.leading, 12)
                Spacer()
                
                // Skip button
                SkipButton(action: {
                    presentationMode.wrappedValue.dismiss()
                })
            }
            
            HStack{
                // Display phone number (Optional)
                Text("Enter the code we've sent by text to \n\(phoneNumber)")
                    .font(Font.custom("Baskerville", size: 16))
                    .padding(.top, 50)
                Spacer()
            }
            
            
            HStack{
                OtpFieldView(onOtpVerified: { success in
                    isOtpVerified = success
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
                        .font(Font.custom("Baskerville", size: 14))
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
        .padding()
        .navigationBarBackButtonHidden(true)  // Hides the default back button
        .sheet(isPresented: $isMoreOptionClicked) {
            MoreOptions(phoneNumber: phoneNumber)
                .presentationDetents([.fraction(0.8), .large])
        }
        .onAppear {
            startTimer() // Start the timer when the view appears
        }
    }
    
    // Format the time to "mm:ss"
    private func formatTime(_ totalSeconds: Int) -> String {
        let minutes = totalSeconds / 60
        let seconds = totalSeconds % 60
        return String(format: "%d:%02d", minutes, seconds)
    }
}

#Preview {
    OtpView(phoneNumber: "123456789")
}


