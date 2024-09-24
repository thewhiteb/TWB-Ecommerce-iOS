//
//  SimpleButton.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 13/08/2024.
//
import SwiftUI

struct SimpleButton: View {
    let title: String
    let action: () -> Void  // Closure for button action
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.custom("Baskerville-SemiBold", fixedSize: 18))
                .fontWeight(.bold)
                .padding()
                .frame(maxWidth: .infinity, minHeight: 60) // Make button full width
                .background(Color.black) // Black background
                .foregroundColor(.white) // White text color
        }
        .padding() // Padding around the button
    }
}

#Preview {
    SimpleButton(title: "Click Me", action: {
        // Example action
        print("Button clicked!")
    })
    .previewLayout(.sizeThatFits)
}
