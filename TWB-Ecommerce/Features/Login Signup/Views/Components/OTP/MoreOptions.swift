//
//  MoreOptions.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 12/09/2024.
//

import SwiftUI

struct MoreOptions: View {
    @Environment(\.presentationMode) var presentationMode
    var phoneNumber: String
    
    // List of options
    let options = [
        (title: "Text Message (SMS)", image: "Message"),
        (title: "WhatsApp", image: "Whatsapp"),
        (title: "Email", image: "Email")
    ]
    
    @State private var selectedOption: Int? = nil  // Track the selected option
    
    var body: some View {
        VStack {
            HStack {
                Text("More Options")
                    .font(.custom("Baskerville", size: 16))
                    .fontWeight(.semibold)
                Spacer()
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image("Close Button")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20) // Adjust size as needed
                }
            }
            .padding(.top, 18)
            .padding(.horizontal)
            
            HStack {
                // Display phone number (Optional)
                Text("Choose another way to get a verification code at (\(phoneNumber))")
                    .font(Font.custom("Baskerville", size: 16))
                    .padding(.top, 28)
                Spacer()
            }
            .padding(.horizontal)
            
           
        
            // Create a list of 3 Items
            VStack(spacing: 0) {
                ForEach(0..<options.count, id: \.self) { index in
                    Button(action: {
                        selectedOption = index
                    }) {
                        HStack {
                            Image(options[index].image) // Use system images for icons
                                .resizable()
                                .frame(width: 26, height: 26)
                                .padding(.vertical, 20)
                            
                            Text(options[index].title)
                                .font(Font.custom("Baskerville", size: 16))
                                .foregroundColor(.black)
                                .padding(.leading, 8)
                            
                            Spacer()
                            
                            // Checkmark icon for selected option
                            Image(systemName: selectedOption == index ? "circle.fill" : "circle")
                                .foregroundColor(selectedOption == index ? .black : .gray)
                                .padding(.trailing, 8)
                        }
                        .background(Color.white)
                    }
                    .frame(maxWidth: .infinity)
                
                    // Add divider between items
                    if index != options.count - 1 {
                        Divider()
                            .background(Color.gray.opacity(0.3))
                    }
                }
            }
            .background(Color.white)
            .cornerRadius(8)
            .padding(.horizontal)
            .padding(.top,20)
            
            Spacer()
            
            SimpleButton(title: "Continue", action: {
                print("Selected option: \(options[selectedOption ?? 0].title)")
            })
            .padding(.bottom, 20)
        }
        .padding()
    }
}

#Preview {
    MoreOptions(phoneNumber: "0543956128")
}


