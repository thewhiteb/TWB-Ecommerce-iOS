//
//  ViewCollectionButton.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 11/09/2024.
//

import SwiftUI

struct BorderButton: View {
    let title: String
    let action: () -> Void  // Closure for button action
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.custom("Baskerville", fixedSize: 14))
                .fontWeight(.semibold)
                .foregroundColor(.black)  // Black text color
                .padding()
                .frame(maxWidth: .infinity, minHeight: 52)  // Make button full width
                .background(Color.white)  // White background
                .overlay(  // Border with black color
                    RoundedRectangle(cornerRadius: 0)
                        .stroke(Color.black, lineWidth: 1)
                )
        }
        .padding()  // Padding around the button
        .shadow(color: .black.opacity(0.15), radius: 3.5, x: 0, y: 4)
    }
}

#Preview {
    BorderButton(title: "View New Collection", action: {
        // Example action
        print("Bordered Button clicked!")
    })
}
