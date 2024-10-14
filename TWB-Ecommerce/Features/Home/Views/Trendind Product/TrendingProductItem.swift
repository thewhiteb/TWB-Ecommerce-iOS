//
//  TrendingProductItem.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 03/09/2024.
//

import SwiftUI
import Lottie
import SDWebImageSwiftUI
import SDWebImage

struct TrendingProductItem: View {
    var item: TrendingProduct
    
    @State private var currentPage = 0
    
    var body: some View {
        VStack(spacing : 0) {
            ZStack {
                let url = Constants.imagesBaseURL + (item.mainItemImages?.first?.imageKey ?? .defaultStr)
                WebImage(url: URL(string: url)) { image in
                    image.resizable().scaledToFit()
                } placeholder: {
                    ImagePlaceholderView()
                }
                .indicator(.activity) // Activity Indicator
                .transition(.fade(duration: 0.5)) // Fade Transition with duration
                .frame(width: 167, height: 195)
                .clipped()
                HStack {
                    Spacer()
                    VStack {
                        TwitterHeart(width: 24, height: 24, imageIcon: "SmallEmptyHeart")
                            .padding(.top,15)
                            .padding(.trailing,10)
                        Spacer()
                    }
                }
            }
            .frame(width: 167, height: 195)
            .background(Color(red: 0.93, green: 0.95, blue: 0.96))

            // Item name
            Text(item.name ?? .defaultStr)
                .font(Font.custom("Baskerville", size: 12))
                .foregroundColor(.black)
                .padding(.top,10)
            // Item price
            Text(String(describing: item.price ?? 0.0))
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
//    TrendingProductItem(
//        images: ["Bouquet1"], // Add your image names here
//        itemName: "Rectangular Acrylic 061",
//        itemPrice: "AED 365",
//        isCustomizable: true
//    )
}
