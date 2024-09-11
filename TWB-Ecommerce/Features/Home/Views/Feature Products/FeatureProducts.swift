//
//  FeatureProducts.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 09/09/2024.
//


import SwiftUI

struct FeatureProducts: View {
    // Array of image names for feature products
    private var imagesArr: [String] = ["FeatureProduct1"]
    
    var body: some View {
        ZStack {
            // Background images
            VStack{
                HStack{
                    Spacer()
                    Image("BGFlower")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 72, height: 72) // Keep background image size static
                        .padding(.trailing,70)
                        .padding(.top,20)
                }
              
                Spacer()
                
                HStack{
                    Image("BGFlower")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 72, height: 72) // Keep background image size static
                        .padding(.leading,20)
                    Spacer()
                }
                
            }
            
            // ScrollView with Feature Products
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0) { // Fixed spacing between items
                    ForEach(0..<5, id: \.self) { index in
                        Image(imagesArr[0])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 320, height: 400) // Fixed card sizes for uniformity
                            .clipped() // Ensures the image does not overflow the bounds
                            .scrollTransition { content, phase in
                                content
                                    .opacity(phase.isIdentity ? 1 : 0.5) // Apply opacity animation
                                    .scaleEffect(phase.isIdentity ? 1 : 0.9) // Apply slight scale animation
                            }
                            .shadow(radius: 3) // Optional shadow for better visibility
                    }
                }
            }
        }
        .frame(height: 480)
        Spacer()
    }
}

#Preview {
    FeatureProducts()
}
