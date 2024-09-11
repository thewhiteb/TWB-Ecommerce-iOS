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
        VStack(spacing : 0) {
            ZStack {
                Image(images[0])
                    .resizable()
                    .scaledToFill()
                    .frame(width: 160, height: 195)
                    .clipped()
                    .padding()
            
                HStack {
                    Spacer()
                    VStack {
                        TwitterHeart()
                            .padding(.top,15)
                            .padding(.trailing,10)
                        Spacer()
                    }
                }
            }
            .frame(width: 205, height: 225)
            .background(Color(red: 0.93, green: 0.95, blue: 0.96))
            
            // Item name
            Text(itemName)
                .font(Font.custom("Baskerville", size: 12))
                .foregroundColor(.black)
                .padding(.top,10)
            // Item price
            Text(itemPrice)
                .font(
                    Font.custom("Baskerville", size: 14)
                        .weight(.semibold)
                )
                .foregroundColor(.black)
                .padding(.top,2)
        }
    }
}

#Preview {
    NewArrivalItem(
        images: ["Bouquets"], // Add your image names here
        itemName: "Rectangular Acrylic 061",
        itemPrice: "AED 365",
        isCustomizable: true)
}
