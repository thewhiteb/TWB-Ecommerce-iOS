//
//  AddOnItems.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 04/10/2024.
//

import SwiftUI

struct AddOnItems: View {
    let images: [String] // Array of image names
    let itemName: String
    let itemPrice: String
    let isCustomizable: Bool
    
    @State private var currentPage = 0
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                // Image slider using TabView
                TabView(selection: $currentPage) {
                    ForEach(0..<images.count, id: \.self) { index in
                        Image(images[index])
                            .resizable()
                            .scaledToFit()
                            .frame(width: 170, height: 200) // Fixed height, dynamic width
                            .clipped()
                            .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // Hide default page indicator
                .frame(width: 170, height: 200) // Fixed height for image slider

                // Custom page indicator dots
                VStack {
                    Spacer()
                    HStack(spacing: 5) { // Customize the spacing between indicators
                        ForEach(0..<images.count, id: \.self) { index in
                            Circle()
                                .frame(width: currentPage == index ? 8 : 6, height: currentPage == index ? 8 : 6)
                                .foregroundColor(currentPage == index ? .black : .gray)
                        }
                    }
                    .padding(.bottom, 10)
                }

                HStack {
                    Spacer()
                    
                    VStack {
                        TwitterHeart(width: 24, height: 24, imageIcon: "SmallEmptyHeart")
                            .padding(.top, 15)
                            .padding(.trailing, 10)
                        Spacer()
                    }
                }
            }
            .background(Color(hex: "#F5F5F5"))

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
        .frame(width: 170, height: 200) // Explicitly set frame to avoid expanding
    }
}

#Preview {
    AddOnItems(
        images: ["Bouquet1","Bouquet1","Bouquet1"], // Add your image names here
        itemName: "Rectangular Acrylic 061",
        itemPrice: "AED 365",
        isCustomizable: true
    )
}
