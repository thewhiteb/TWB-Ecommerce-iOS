//
//  SimpleButtonBlack.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 25/09/2024.
//

import SwiftUI

struct SimpleButtonBlack: View {
    var action: () -> Void  // Closure for the action when the button is clicked
    let text: String
    
    var body: some View {
        Button(action: {
            action()  // Perform the action passed in
        }) {
            Text(text)
                .font(Font.custom("Baskerville", size: 12))  // Customize text style
                .foregroundColor(Color.white)  // Text color
                .padding()
                .frame(maxWidth: .infinity, maxHeight: 40)  // Ensure the button fills available space
                .background(Color.black)  // Set background color
        }
    }
}


#Preview {
    SimpleButtonBlack(action: {
        print("Button 1 clicked")
    }, text: "Button 1")
}
