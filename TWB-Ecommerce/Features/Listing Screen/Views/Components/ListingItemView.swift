//
//  ListingItemView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 18/09/2024.
//

import SwiftUI
import Lottie

struct ListingItemView: View {
    let images: [String] // Array of image names
    let itemName: String
    let itemPrice: String
    let isCustomizable: Bool
    
    @State private var currentPage = 0
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                ZStack {
                    // Image slider using TabView
                    TabView(selection: $currentPage) {
                        ForEach(0..<images.count, id: \.self) { index in
                            Image(images[index])
                                .resizable()
                                .scaledToFit()
                                .frame(width: geometry.size.width, height: 195) // Fixed height, dynamic width
                                .clipped()
                                .tag(index)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // Hide default page indicator
                    .frame(width: geometry.size.width, height: 195) // Fixed height for image slider

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
//                        VStack(alignment: .leading) {
//                            if isCustomizable {
//                                Text("Customizable")
//                                    .font(.custom("Lato", size: 10))
//                                    .padding(6)
//                                    .background(Color.black.opacity(0.7))
//                                    .foregroundColor(.white)
//                                    .padding(8)
//                            }
//                            Spacer()
//                        }
//                        .padding(.top, 5)
//                        .padding(.leading, 5)
                        
                        Spacer()
                        
                        VStack {
                            TwitterHeart()
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
            .frame(width: geometry.size.width) // Dynamic width, fixed height
        }
        .frame(height: 240) // 195 for the image + padding for text
    }
}

#Preview {
    ListingItemView(
        images: ["Bouquet1","Bouquet1","Bouquet1"], // Add your image names here
        itemName: "Rectangular Acrylic 061",
        itemPrice: "AED 365",
        isCustomizable: true)
}
