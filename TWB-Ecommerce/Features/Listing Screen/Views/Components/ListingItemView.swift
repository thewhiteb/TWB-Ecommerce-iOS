//
//  ListingItemView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 18/09/2024.
//

import SwiftUI
import Lottie

struct ListingItemView: View {
    
    let  item  : TrendingProduct
    @State private var currentPage = 0
    var animation  : Namespace.ID
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                ZStack {
                    // Image slider using TabView
                    TabView(selection: $currentPage) {
                        ForEach(0..<item.images.count, id: \.self) { index in
                            Image(item.images[index])
                                .resizable()
                                .scaledToFit()
                                .frame(width: geometry.size.width, height: 220) // Fixed height, dynamic width
                                .clipped()
                                .tag(index)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // Hide default page indicator
                    .frame(width: geometry.size.width, height: 220) // Fixed height for image slider
                    
                    
                    // Custom page indicator dots
                    VStack {
                        Spacer()
                        HStack(spacing: 5) { // Customize the spacing between indicators
                            ForEach(0..<item.images.count, id: \.self) { index in
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
                Text(item.itemName)
                    .font(Font.custom("Baskerville", size: 12))
                    .foregroundColor(.black)
                    .padding(.top, 10)
                
                // Item price
                Text(item.itemPrice)
                    .font(Font.custom("Baskerville", size: 14).weight(.semibold))
                    .foregroundColor(.black)
                    .padding(.top, 2)
            }
            .frame(width: geometry.size.width) // Dynamic width, fixed height
        }
        .frame(height: 270)
        .matchedGeometryEffect (id : item.id,in : animation)
    }
}

//#Preview {
//    
//    @Previewable @State var sampleItem =
//    TrendingProduct( images: ["Bouquet1","Bouquet1","Bouquet1"],
//                     itemName: "Rectangular Acrylic 061",
//                     itemPrice: "AED 365",
//                     isCustomizable: true)
//    
//    ListingItemView(
//        item: sampleItem
//    )
//}
