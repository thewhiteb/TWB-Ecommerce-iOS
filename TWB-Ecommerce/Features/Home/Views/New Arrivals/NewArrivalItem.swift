//
//  NewArrivalItem.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 11/09/2024.
//

import SwiftUI
import Lottie
import SDWebImageSwiftUI
import SDWebImage

struct NewArrivalItem: View {
    
    let images: [MainItemImage]
    let itemName: String
    let itemPrice: String
    let isCustomizable: Bool
    
    @State private var currentPage = 0
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                ZStack {
                    VStack{
                        let url = Constants.imagesBaseURL + (images.first?.imageKey ?? "")
                        WebImage(url: URL(string: url)) { image in
                            image.resizable() // Control layout like SwiftUI.AsyncImage, you must use this modifier or the view will use the image bitmap size
                        } placeholder: {
                            Rectangle().foregroundColor(.gray)
                        }
                        .indicator(.activity) // Activity Indicator
                        .transition(.fade(duration: 0.5)) // Fade Transition with duration
                        .scaledToFit()
                        .frame(width: geometry.size.width, height: 195)
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
                .background(Color(hex: "#F5F5F5"))

                // Item name
                Text(itemName)
                    .font(Font.custom("Baskerville", size: 12))
                    .foregroundColor(.black)
                    .padding(.top, 10)
                    .lineLimit(1)

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
//    NewArrivalItem(
//        images: ["Bouquets"], // Add your image names here
//        itemName: "Rectangular Acrylic 061",
//        itemPrice: "AED 365",
//        isCustomizable: true)
}
