//
//  DetailHeaderView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 26/09/2024.
//

import SwiftUI

struct DetailHeaderView: View {
    @Binding var headerOpacity: Double
    var onBackButtonPressed: () -> Void
    @Binding var showDetails: Bool
    
    var body: some View {
            VStack (spacing : 0) {
                HStack {
                    
                    if showDetails{
                        Button(action: {
                            onBackButtonPressed()
                        }) {
                            Image("back")
                                .foregroundColor(.black)
                                .frame(maxHeight: .infinity)  // Ensure the button takes full available height for vertical centering
                        }
                        
                        Spacer()
                        
                       
                         Text("Tube Acrylic 018")
                            .font(.getFont(name: .libreBold, size: 16))
                             .fontWeight(.semibold)
                             .opacity(headerOpacity)
                             .padding(.leading, 32)
                        
                        Spacer()
                        
                        Button(action: {
                            // Share button action
                        }) {
                            Image("Share")
                                .foregroundColor(.black)
                                .frame(maxHeight: .infinity)  // Ensure the button takes full available height for vertical centering
                        }
                        .padding(.trailing, 10)
                    }
                    Button(action: {
                        // Favorite button action
                    }) {
                        TwitterHeart(width: 27, height: 27, imageIcon: "favorite")
                            .frame(maxHeight: .infinity)  // Ensure the button takes full available height for vertical centering
                    }
                }
                .frame(maxWidth: .infinity)  // Ensure the HStack takes full width
                .frame(height: 70)  // Set the fixed content height for the header
                .padding(.horizontal)
                .padding(.top, 60)
                .background(Color.white.opacity(headerOpacity))  // Background opacity depends on scroll
                Spacer()  // Pushes the content of the VStack up
            }
            .shadow(color: Color.black.opacity(headerOpacity * 0.2), radius: 5, x: 0, y: 2)
        
    }
}

