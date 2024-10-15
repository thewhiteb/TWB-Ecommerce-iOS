//
//  OtpFieldView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 12/09/2024.
//

import SwiftUI

struct OtpFieldView: View {
    @State private var otp: [String] = Array(repeating: "", count: 4)  // Holds the OTP digits
    @State private var focusedIndex: Int = 0  // Index of the currently focused square
    @State private var isError: Bool = false  // To indicate an error and turn squares red
    @FocusState private var isFieldFocused: Int?  // Focused state
    
   
    
    var verifyOTP : (String) -> Void
    
    var body: some View {
        VStack(alignment :.leading) {
            HStack(spacing: 10) {
                ForEach(0..<4, id: \.self) { index in
                    TextField("", text: $otp[index])
                        .frame(width: 60, height: 60)  // Square shape
                        .font(Font.custom("Baskerville", size: 28))
                        .multilineTextAlignment(.center)
                        .keyboardType(.numberPad)
                        .textFieldStyle(PlainTextFieldStyle())
                        .accentColor(.black)
                        .focused($isFieldFocused, equals: index)  // Focus each field
                        .background(RoundedRectangle(cornerRadius: 0)
                            .stroke(isError ? Color.red : (focusedIndex == index ? Color.black : Color(red: 0.85, green: 0.85, blue: 0.85)), lineWidth: 1))
                        .onChange(of: otp[index]) { newValue in
                            // Automatically move to the next field
                            if newValue.count == 1 && index < 3 {
                                focusedIndex = index + 1
                                isFieldFocused = focusedIndex
                            } else if newValue.count == 1 && index == 3 {
                                // All OTP digits are filled, verify OTP
                                let enteredOtp = otp.joined()
                                isFieldFocused = nil  // Remove focus after the last digit is entered
                                verifyOTP(enteredOtp)
                            } else if newValue.isEmpty && index > 0 {
                                // Move back to the previous field if the field is empty
                                focusedIndex = index - 1
                                isFieldFocused = focusedIndex
                            }
                        }
                }
            }
            
            // Show error message if OTP is incorrect
            if isError {
                HStack(spacing : 0) {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .foregroundColor(.red)  // Color the icon red to match the error text
                    Text("Incorrect code. Please Try again")
                        .foregroundColor(.red)
                        .font(Font.custom("Baskerville", size: 14))
                        .padding(.leading,5)
                }
                .padding(.top, 8)
            }
        }
//        .onAppear {
//            isFieldFocused = 0  // Focus the first field on appear
//        }
    }
    
    // Handles the wrong OTP case: clears fields, turns red, then resets after 1 second
    private func handleWrongOtp() {
        // Show error and clear OTP fields
        isError = true
        otp = Array(repeating: "", count: 4)
        
        // Wait for 1 second, then reset fields and focus the first box again
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            isError = false
            focusedIndex = 0
            isFieldFocused = 0  // Refocus the first field
        }
    }
}

struct ContentViewOTP: View {
    @State private var isOtpVerified: Bool = false
    
    var body: some View {
        VStack {
            OtpFieldView(verifyOTP: { value in
                
            })
            
            if isOtpVerified {
                Text("OTP Verified Successfully!").foregroundColor(.green)
            }
        }
    }
}

#Preview {
    ContentViewOTP()
}
