//
//  SimpleButtonWhite.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 25/09/2024.
//

import SwiftUI

struct SimpleButtonWhite: View {
    var action: () -> Void  // Closure for the action when the button is clicked
    let text: String
    
    var body: some View {
        Button(action: {
            action()  // Perform the action passed in
        }) {
            Text(text)
                .font(Font.custom("Baskerville", size: 14))  // Customize text style
                .foregroundColor(Color.gray)  // Text color
                .padding()
                .frame(maxWidth: .infinity, maxHeight: 40)  // Ensure the button fills available space
                .overlay(
                    RoundedRectangle(cornerRadius: 0)
                        .stroke(Color.gray, lineWidth: 0.5) 
                )
        }
    }
}

#Preview {
    SimpleButtonWhite(action: {
        
    },text: "Clear Filters")
}
