//
//  OTPFieldNew.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 16/10/2024.
//

import SwiftUI
import Combine

public struct OTPFieldNew: View {
    
    
    @Binding var otpCode: String
    var otpCodeLength: Int = 4
    var onCompletion: (() -> Void)?
    
    @FocusState private var isTextFieldFocused: Bool
    
    //MARK: Constructor
    public init(otpCode: Binding<String>, onCompletion: (() -> Void)? = nil) {
        self._otpCode = otpCode
        self.onCompletion = onCompletion
    }
    
    //MARK: Body
    public var body: some View {
        HStack {
            ZStack(alignment: .center) {
                TextField("", text: $otpCode)
                    .frame(width: 0, height: 0, alignment: .center)
                    .font(Font.system(size: 0))
                    .accentColor(.clear)
                    .foregroundColor(.clear)
                    .multilineTextAlignment(.center)
                    .keyboardType(.numberPad)
                    .focused($isTextFieldFocused)
                    .onAppear {
                        // Automatically focus the text field when the view appears
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            isTextFieldFocused = true
                        }
                    }
                    .onChange(of: otpCode) { newValue in
                        limitText(otpCodeLength)
                        checkCompletion()  // Check if OTP is complete only when length is 4
                    }
                    .padding()
                
                HStack {
                    ForEach(0..<otpCodeLength, id: \.self) { index in
                        ZStack {
                            Text(self.getPin(at: index))
                                .font(.getFont(name: .libreRegular, size: 28))
                                .fontWeight(.semibold)
                                .foregroundColor(Constants.black)
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(Constants.grayBorder)
                                .padding(.trailing, 5)
                                .padding(.leading, 5)
                                .opacity(self.otpCode.count <= index ? 1 : 0)
                        }
                    }
                }
            }
        }
        .onTapGesture {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                isTextFieldFocused = true
            }
        }
        .frame(height: 50)
    }
    
    //MARK: func
    private func getPin(at index: Int) -> String {
        guard self.otpCode.count > index else {
            return ""
        }
        return self.otpCode[index]
    }
    
    private func limitText(_ upper: Int) {
        if otpCode.count > upper {
            otpCode = String(otpCode.prefix(upper))
        }
    }
    
    private func checkCompletion() {
        // Only call onCompletion if the OTP length is exactly equal to the limit (4 digits)
        if otpCode.count == otpCodeLength {
            onCompletion?()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                isTextFieldFocused = false
            }
        }
    }
}

extension String {
    subscript(idx: Int) -> String {
        String(self[index(startIndex, offsetBy: idx)])
    }
}
