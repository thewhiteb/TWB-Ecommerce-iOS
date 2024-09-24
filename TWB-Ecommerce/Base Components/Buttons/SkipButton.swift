//
//  SkipButton.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 12/09/2024.
//

import SwiftUI

struct SkipButton: View {
    var action: () -> Void  // Closure for the action when button is clicked
    
    var body: some View {
        Button(action: {
            action()  // Perform the action passed in
        }) {
            Text("Skip")
                .font(Font.custom("Baskerville", size: 12))  // Customize text style
                .foregroundColor(.black)  // Text color
                .padding(.horizontal, 19)  // Horizontal padding for the button
                .padding(.vertical, 11)  // Vertical padding for the button
                .cornerRadius(30)  // Capsule shape
        }
        .overlay(  // Add a border with capsule shape
            RoundedRectangle(cornerRadius: 30)
                .stroke(Color.gray, lineWidth: 1)  // Light grey border
        )
    }
}

#Preview {
    SkipButton(action: {
        
    })
}
