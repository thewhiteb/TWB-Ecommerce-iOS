//
//  ShopByFlowers.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 11/09/2024.
//


import SwiftUI

struct ShopByFlowers: View {
    
    // Sample data using the GiftItem model
    let items = [
        GiftItem(imageName: "Rose", imageText: "Rose"),
        GiftItem(imageName: "Gerbera", imageText: "Gerbera"),
        GiftItem(imageName: "Rose", imageText: "Rose"),
        GiftItem(imageName: "Gerbera", imageText: "Gerbera"),
        GiftItem(imageName: "Rose", imageText: "Rose"),
        GiftItem(imageName: "Gerbera", imageText: "Gerbera"),
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {  // Adjust the spacing between items
                ForEach(items, id: \.imageName) { item in
                    VStack {
                        ZStack{
                            // Display image
                            Image(item.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 124, height: 124)
                                
                        }
                        .frame(width: 150, height: 176)  // Adjust the size
                        .background(Color.white)
                        
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
    ShopByFlowers()
}
