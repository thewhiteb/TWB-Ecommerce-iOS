//
//  TrendingProductItem.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 03/09/2024.
//

import SwiftUI
import Lottie

struct TrendingProductItem: View {
    let images: [String] // Array of image names
    let itemName: String
    let itemPrice: String
    let isCustomizable: Bool
    
    @State private var currentPage = 0
    
    var body: some View {
        VStack(spacing : 0) {
            ZStack {
//                // Image slider using TabView
//                TabView(selection: $currentPage) {
//                    ForEach(0..<images.count, id: \.self) { index in
//                        Image(images[index])
//                            .resizable()
//                            .scaledToFill()
//                            .frame(width: 167, height: 195)
//                            .clipped()
//                            .tag(index)
//                    }
//                }
//                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // Hide default page indicator
//                .frame(width: 167, height: 195)
                
                Image(images[0])
                    .resizable()
                    .scaledToFill()
                    .frame(width: 167, height: 195)
                    .clipped()

//                // Custom page indicator dots
//                VStack {
//                    Spacer()
//                    HStack(spacing: 5) { // Customize the spacing between indicators
//                        ForEach(0..<images.count, id: \.self) { index in
//                            Circle()
//                                .frame(width: currentPage == index ? 8 : 6, height: currentPage == index ? 8 : 6)
//                                .foregroundColor(currentPage == index ? .white : .white)
//                        }
//                    }
//                    .padding(.bottom, 10)
//                }

                HStack {
//                    VStack(alignment: .leading) {
//                        if isCustomizable {
//                            Text("Customizable")
//                                .font(.custom("Lato", size: 10))
//                                .padding(6)
//                                .background(Color.black.opacity(0.7))
//                                .foregroundColor(.white)
//                                .padding(8)
//                        }
//                        Spacer()
//                    }
//                    .padding(.top, 5)
//                    .padding(.leading, 5)
                    
                    Spacer()
                    
                    VStack {
                        TwitterHeart()
                            .padding(.top,15)
                            .padding(.trailing,10)
                        Spacer()
                    }
                }
            }
            .frame(width: 167, height: 195)
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
    TrendingProductItem(
        images: ["Bouquet1"], // Add your image names here
        itemName: "Rectangular Acrylic 061",
        itemPrice: "AED 365",
        isCustomizable: true
    )
}
