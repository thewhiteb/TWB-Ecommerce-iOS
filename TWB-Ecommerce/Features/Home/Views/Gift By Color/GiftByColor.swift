//
//  GiftByColor.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 11/09/2024.
//

import SwiftUI

struct GiftByColor: View {
    
    // Sample data using the GiftItem model
    let items = [
        GiftItem(imageName: "WhiteBouquet", imageText: "White"),
        GiftItem(imageName: "RedBouquet", imageText: "Red"),
        GiftItem(imageName: "PinkBouquet", imageText: "Pink"),
        GiftItem(imageName: "WhiteBouquet", imageText: "White"),
        GiftItem(imageName: "RedBouquet", imageText: "Red"),
        GiftItem(imageName: "PinkBouquet", imageText: "Pink")
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 5) {  // Adjust the spacing between items
                ForEach(items, id: \.imageName) { item in
                    VStack {
                        // Display image in a circle
                        Image(item.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120, height: 120)  // Adjust the size
                            .clipShape(Circle())  // Circular shape
                            .overlay(Circle().stroke(Color.white, lineWidth: 2))  // Border around the circle
                        
                        // Text below the image
                        Text(item.imageText)
                            .font(.custom("Baskerville", size: 16))
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .padding(.top, 5)  // Space between image and text
                    }
                }
            }
            .padding(.horizontal, 10)  // Padding around the horizontal scroll view
        }
    }
}

#Preview {
    GiftByColor()
}

