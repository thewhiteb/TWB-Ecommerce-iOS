//
//  DetailHeaderView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 26/09/2024.
//

import SwiftUI

struct DetailHeaderView: View {
    @Binding var headerOpacity: Double
    
    var body: some View {
        GeometryReader { geometry in
            let topSafeAreaHeight = geometry.safeAreaInsets.top
            let totalHeight = 50 + topSafeAreaHeight  // Base height of 50 plus the top safe area height
            
            VStack {
                HStack {
                    Button(action: {
                        // Back button action
                    }) {
                        Image("back")
                            .foregroundColor(.black)
                            .frame(maxHeight: .infinity)  // Ensure the button takes full available height for vertical centering
                    }
                    
                    Spacer()
                    
                    // Uncomment if you want to add a title in the center of the header
                    // Text("Product Detail")
                    //     .font(.headline)
                    //     .fontWeight(.semibold)
                    //     .opacity(headerOpacity)
                    
                    Spacer()
                    
                    Button(action: {
                        // Share button action
                    }) {
                        Image("Share")
                            .foregroundColor(.black)
                            .frame(maxHeight: .infinity)  // Ensure the button takes full available height for vertical centering
                    }
                    .padding(.trailing, 10)
                    
                    Button(action: {
                        // Favorite button action
                    }) {
                        Image("favorite")
                            .frame(maxHeight: .infinity)  // Ensure the button takes full available height for vertical centering
                    }
                }
                .frame(maxWidth: .infinity)  // Ensure the HStack takes full width
                .frame(height: 70)  // Set the fixed content height for the header
                .padding(.top, topSafeAreaHeight + 50)
                .padding(.horizontal)
                .background(Color.white.opacity(headerOpacity))  // Background opacity depends on scroll
                .shadow(color: Color.black.opacity(headerOpacity * 0.2), radius: 5, x: 0, y: 2)
                
                Spacer()  // Pushes the content of the VStack up
            }
        }
        .frame(height: 50)  // Ensure it has a minimum height of 50
    }
}

#Preview {
    DetailHeaderView(headerOpacity: .constant(1.0))
}
