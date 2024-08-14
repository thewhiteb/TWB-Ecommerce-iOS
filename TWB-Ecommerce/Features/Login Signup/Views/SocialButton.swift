//
//  SocialButton.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 13/08/2024.
//

import SwiftUI

struct SocialButton: View {
    let imageName: String
        let action: () -> Void  // Closure for button action

        var body: some View {
            Button(action: action) {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .padding()  // Add padding around the image
            }
            .frame(maxWidth: .infinity, maxHeight: 60)  // Set the size of the button
            .background(Color(red: 0.97, green: 0.97, blue: 0.97))  // Light grey background
        }
}

#Preview {
    SocialButton(imageName: "google_logo") {
           // Example action
           print("Google button clicked!")
       }
}
