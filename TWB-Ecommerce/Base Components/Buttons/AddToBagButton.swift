//
//  AddToBagButton.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 27/09/2024.
//

import SwiftUI

struct AddToBagButton: View {
    var action: () -> Void  // Closure for the action when the button is clicked
    let text: String
    let imageName: String  // Name of the image
    
    var body: some View {
        Button(action: {
            action()  // Perform the action passed in
        }) {
            HStack {
                Image(imageName)  // Add an image to the button
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)  // Set the image size
                    .foregroundColor(.white)  // Set the image color
                
                Text(text)
                    .font(.getFont(name: .libreRegular, size: 16))  // Customize text style
                    .foregroundColor(Color.white)  // Text color
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: 50)  // Ensure the button fills available space
            .background(Color.black)  // Set background color
        }
    }
}

#Preview {
    AddToBagButton(action: {
        print("Button clicked")
    }, text: "Add to Bag", imageName: "bag")  // Example with SF Symbols image
}

