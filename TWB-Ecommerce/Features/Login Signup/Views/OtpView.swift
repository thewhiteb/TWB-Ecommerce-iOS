//
//  OtpView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 12/09/2024.
//

import SwiftUI

struct OtpView: View {
    
    @StateObject private var viewModel = OTPViewModel()
    @EnvironmentObject var loginViewModel : LoginViewModel
    
    var phoneNumber: String
    var isComingFromCheckout: Bool = false
    var onBackButtonClick: () -> Void
    
    
    var body: some View {
        
        VStack {
            VStack (alignment : .leading) {
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
                        .font(.getFont(name: .libreBold, size: 16))
                        .foregroundColor(.black)
                        .fontWeight(.semibold)
                        .frame(width: 192, height: 18, alignment: .topLeading)
                        .padding(.leading, 12)
                    Spacer()
                    
                    if (isComingFromCheckout && viewModel.count >= 2){
                        SkipButton(action: {
                        })
                    }
                    
                }
                .padding(.top, 70)
                .padding(.horizontal, 16)
                
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Constants.grayBorder)
                    .padding(.top, 30)
                
                HStack{
                    // Display phone number (Optional)
                    Text("Enter the code we've sent by text to \n\(phoneNumber)")
                        .font(.getFont(name: .libreRegular, size: 14))
                        .padding(.top, 30)
                    Spacer()
                }
                .padding(.horizontal, 16)
                
                HStack{
                    OtpFieldView(isError: viewModel.isError, error: (viewModel.err ?? "") , verifyOTP: { value in
                        viewModel.otp = value
                        viewModel.verifyOTP(phoneNumber: phoneNumber)
                    })
                    Spacer()
                }
                .padding(.top, 30)
                .padding(.horizontal, 16)
                
                HStack{
                    // Text for resend OTP with timer
                    Button(action: {
                        
                    }) {
                        Group {
                            if viewModel.isClickable {
                                getColoredText() // Assuming this returns a Text view
                            } else {
                                Text("I didn't receive the code in (\(viewModel.formatTime()))")
                            }
                        }
                        .font(.getFont(name: .libreRegular, size: 14))
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(Color.gray.opacity(0.2)) // Change background when clickable
                        .foregroundColor(viewModel.isClickable ? .white : .black) // Text color changes when clickable
                        .cornerRadius(25) // Capsule background
                    }
                    .disabled(!viewModel.isClickable) // Disable button until it's clickable
                    
                    Spacer()
                }
                .padding(.top, 30)
                .padding(.horizontal, 16)
                
                if viewModel.isClickable {
                    
                    Button(action : {
                        loginViewModel.sendOtp()
                        viewModel.startTimer()
                    }){
                        Text ("Send Again")
                            .font(.getFont(name: .latoBold, size: 14))
                            .underline()
                            .foregroundColor(Color.black)
                    }
                    
                    .padding(.top,10)
                    .padding(.horizontal, 16)
                }
                
                
                
                
                Spacer()
                
                if viewModel.isClickable {
                    HStack (spacing : 0) {
                        Text("Having trouble?")
                            .font(.getFont(name: .libreRegular , size: 12))
                        Text(" Choose another way")
                            .font(.getFont(name: .libreBold , size: 12)).underline()
                            .onTapGesture {
                                if viewModel.isClickable {
                                    viewModel.toggleMoreOptions()
                                }
                            }
                        Spacer()
                    }
                    
                    .padding(.horizontal, 16)
                }
                
                SimpleButton(title: "Continue", action: {
                    print("Hello")
                })
            }
            
            .navigationBarBackButtonHidden(true)  // Hides the default back button
            .sheet(isPresented: $viewModel.isMoreOptionClicked) {
                MoreOptions(phoneNumber: phoneNumber)
                    .presentationDetents([.fraction(0.8), .large])
            }
            .onAppear {
                viewModel.startTimer() // Start the timer when the view appears
            }
            .onDisappear(){
                viewModel.stopTimer()
            }
        }
        .background(Color.white)
        .padding(.bottom, 50)
    }
    
    private func getColoredText() -> Text {
        "I didn't receive the code (0:00)"
            .colorWord("(0:00)",
                       wordColor: Color.red,
                       defaultColor: Constants.black)
            .font(.getFont(name: .libreRegular, size: 14))
    }
}
