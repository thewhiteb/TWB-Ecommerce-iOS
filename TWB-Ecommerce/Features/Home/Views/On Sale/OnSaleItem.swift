//
//  OnSaleItem.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 11/09/2024.
//

import SwiftUI
import Lottie

struct OnSaleItem: View {
    //    let images: [String] // Array of image names
    //    let itemName: String
    //    let itemPrice: String
    //    let isCustomizable: Bool
    //    let previousPrice : String
    //    
    //    @State private var currentPage = 0
    //    
    //    var body: some View {
    //        VStack(spacing : 0) {
    //            ZStack {
    //                
    //                Image(images[0])
    //                    .resizable()
    //                    .scaledToFill()
    //                    .frame(width: 160, height: 195)
    //                    .clipped()
    //                    .padding()
    //                
    //                HStack {
    //                    Spacer()
    //                    VStack {
    //                        TwitterHeart()
    //                            .padding(.top,15)
    //                            .padding(.trailing,10)
    //                        Spacer()
    //                    }
    //                }
    //            }
    //            .frame(width: 210, height: 225)
    //            .background(Color(red: 0.93, green: 0.95, blue: 0.96))
    //            
    //            // Item name
    //            Text(itemName)
    //                .font(Font.custom("Baskerville", size: 12))
    //                .foregroundColor(.black)
    //                .padding(.top,10)
    //            // Item price
    //            Text(itemPrice)
    //                .font(
    //                    Font.custom("Baskerville", size: 14)
    //                        .weight(.semibold)
    //                )
    //                .foregroundColor(.red)
    //                .padding(.top,2)
    //            
    //            // Previous Item price
    //            Text(itemPrice)
    //                .font(
    //                    Font.custom("Baskerville", size: 10)
    //                        .weight(.semibold)
    //                )
    //                .foregroundColor(Color(red: 0.7, green: 0.7, blue: 0.7))
    //                .strikethrough(true, color: Color(red: 0.7, green: 0.7, blue: 0.7))  // Add strikethrough with color
    //                .padding(.top,2)
    //        }
    
    
    let images: [String] // Array of image names
    let itemName: String
    let itemPrice: String
    let isCustomizable: Bool
    let previousPrice : String
    
    @State private var currentPage = 0
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                ZStack {
                    VStack{
                        Image(images[0])
                            .resizable()
                            .scaledToFill()
                            .frame(width: geometry.size.width, height: 205) // Fixed height, dynamic width
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
                    .foregroundColor(Color(red: 0.58, green: 0.03, blue: 0.16))
                    .padding(.top, 2)
                // Previous Item price
                Text(previousPrice)
                    .font(
                        Font.custom("Baskerville", size: 10)
                            .weight(.semibold)
                    )
                    .foregroundColor(Color(red: 0.7, green: 0.7, blue: 0.7))
                    .strikethrough(true, color: Color(red: 0.7, green: 0.7, blue: 0.7))  // Add strikethrough with 
            }
            .frame(width: geometry.size.width) // Dynamic width, fixed height
        }
        .frame(height: 260) // 195 for the image + padding for text
    }
}

#Preview {
    OnSaleItem(
        images: ["Bouquets"], // Add your image names here
        itemName: "Rectangular Acrylic 061",
        itemPrice: "AED 265 - 30%",
        isCustomizable: true,
        previousPrice: "AED 365")
}
