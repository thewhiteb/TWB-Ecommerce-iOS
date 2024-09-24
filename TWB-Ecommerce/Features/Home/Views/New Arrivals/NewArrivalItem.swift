//
//  NewArrivalItem.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 11/09/2024.
//

import SwiftUI
import Lottie

struct NewArrivalItem: View {
    
    let images: [String] // Array of image names
    let itemName: String
    let itemPrice: String
    let isCustomizable: Bool
    
    @State private var currentPage = 0
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                ZStack {
                    VStack{
                        Image(images[0])
                            .resizable()
                            .scaledToFill()
                            .frame(width: geometry.size.width, height: 195) // Fixed height, dynamic width
                            .clipped()
                    }
                    


                    HStack {
                        Spacer()
                        
                        VStack {
                            TwitterHeart()
                                .padding(.top, 15)
                                .padding(.trailing, 10)
                            Spacer()
                        }
                    }
                }
                .background(Color(red: 0.93, green: 0.95, blue: 0.96))

                // Item name
                Text(itemName)
                    .font(Font.custom("Baskerville", size: 12))
                    .foregroundColor(.black)
                    .padding(.top, 10)

                // Item price
                Text(itemPrice)
                    .font(Font.custom("Baskerville", size: 14).weight(.semibold))
                    .foregroundColor(.black)
                    .padding(.top, 2)
            }
            .frame(width: geometry.size.width) // Dynamic width, fixed height
        }
        .frame(height: 240) // 195 for the image + padding for text
    }
}

#Preview {
    NewArrivalItem(
        images: ["Bouquets"], // Add your image names here
        itemName: "Rectangular Acrylic 061",
        itemPrice: "AED 365",
        isCustomizable: true)
}
