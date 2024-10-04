//
//  NeedHelpLargeView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 04/10/2024.
//

import SwiftUI

struct NeedHelpLargeView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        VStack {
            // Header section
            HStack {
                Image("help_ic")
                Text("Need Help?")
                    .font(.getFont(name: .libreBold, size: 16))
                
                Spacer()
                Button (action : {
                    presentationMode.wrappedValue.dismiss()
                }){
                    Image("Close Button")
                }
              
            }
            .padding(.bottom, 20)
            
            // Description text
            Text("If you have any questions, reach out to us anytime. Our support team is available 24/7 and we're here to assist you")
                .font(.getFont(name: .libreRegular, size: 12))
                .lineSpacing(5)
                .padding(.top, 15)
                .multilineTextAlignment(.leading)
            
            Spacer().frame(height: 20)
            
            // Buttons with icons and text
            HStack(spacing: 10) {
                // Call Us button
                Button(action: {
                    // Add action for the button here
                }) {
                    HStack {
                        Image("ic_callhelp") // Replace with your own image
                            .font(.system(size: 18))
                        Text("Call Us")
                            .font(.getFont(name: .libreRegular, size: 14))
                    }
                    .frame(maxWidth: .infinity, minHeight: 50) // Equal width for both buttons
                    .foregroundColor(.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: 0)
                            .stroke(Color.black, lineWidth: 1)
                    )
                }
                
                // WhatsApp button
                Button(action: {
                    // Add action for the button here
                }) {
                    HStack {
                        Image("ic_whatsapphelp") // Replace with your own image
                            .font(.system(size: 18))
                        Text("WhatsApp")
                            .font(.getFont(name: .libreRegular, size: 14))
                    }
                    .frame(maxWidth: .infinity, minHeight: 50) // Equal width for both buttons
                    .foregroundColor(.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: 0)
                            .stroke(Color.black, lineWidth: 1)
                    )
                }
            }
            .padding(.top, 20)
        }
        .padding()
    }
}

#Preview {
    NeedHelpLargeView()
}

