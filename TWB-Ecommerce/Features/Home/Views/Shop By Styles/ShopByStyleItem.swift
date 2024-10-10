//
//  ShopByStyleItem.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 11/09/2024.
//

import SwiftUI
import SDWebImageSwiftUI
import SDWebImage

struct ShopByStyleItem: View {
    var item: ProductItem
    
    var body: some View {
        VStack(alignment: .center,spacing: 0) {
            Text(item.name ?? .defaultStr)
                .font(Font.custom("Baskerville", size: 16))
                .fontWeight(.semibold)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .padding(.top,20)
            Spacer()
            let url = Constants.imagesBaseURL + (item.storyImageKey ?? .defaultStr)
            WebImage(url: URL(string: url)) { image in
                image.resizable().scaledToFit()
            } placeholder: {
                Rectangle().foregroundColor(.gray)
            }
            .indicator(.activity) // Activity Indicator
            .transition(.fade(duration: 0.5)) // Fade Transition with duration
            .scaledToFit()
            .frame(height: 180)
            .padding(0)
        }
        .frame(width: 130, height: 220) // Fix the frame size of the VStack
        .padding()
        .background(Color.white)
        .shadow(color: .black.opacity(0.15), radius: 2.5, x: 1, y: 1)
    }
}

#Preview {
//    ShopByStyleItem(item: ItemModel(imageName: "AcrylicBox", itemText: "ACRYLIC BOXES"))
}
