//
//  SimpleTextField.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 12/09/2024.
//

import SwiftUI

struct SimpleTextField: View {
    @Binding var text: String  // Use a binding to pass data to the main screen
    var hint: String  // Hint to be passed from the main screen
    
    var body: some View {
        TextField(hint, text: $text)  // Use the hint as the placeholder
            .font(Font.custom("Baskerville", size: 16))
            .frame(height: 40)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 0)
                    .stroke(Color(red: 0.85, green: 0.85, blue: 0.85), lineWidth: 1)
            )
    }
}

struct ContentViewSignup: View {
    @State private var textFieldValue: String = ""  // State to hold the text field value
    
    var body: some View {
        VStack {
            // Pass the hint as a parameter
            SimpleTextField(text: $textFieldValue, hint: "Email")
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentViewSignup()
}

