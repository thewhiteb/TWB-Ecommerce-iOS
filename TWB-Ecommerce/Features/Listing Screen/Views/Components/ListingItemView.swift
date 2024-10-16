//
//  ListingItemView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 18/09/2024.
//

import SwiftUI
import Lottie
import SDWebImageSwiftUI
import SDWebImage

/*
 Image(item.images[index])
     .resizable()
     .scaledToFit()
     .frame(width: geometry.size.width, height: 220) // Fixed height, dynamic width
     .clipped()
     .tag(index)
 */

struct ListingItemView: View {
    
    let listItem: ListingScreenItem
    @State private var currentPage = 0
    var animation: Namespace.ID
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                ZStack {
                    // Image slider using TabView
                    TabView(selection: $currentPage) {
                        ForEach(0..<listItem.mainItemImages.count, id: \.self) { index in
                            let url = Constants.imagesBaseURL + (listItem.mainItemImages[index].imageKey ?? "")
                            WebImage(url: URL(string: url)) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .tag(index)
                            } placeholder: {
                                ImagePlaceholderView()
                            }
                            .indicator(.activity) // Activity Indicator
                            .transition(.fade(duration: 0.5)) // Fade Transition with duration
                            .frame(width: geometry.size.width, height: 220) // Fixed height, dynamic width
                            .clipped()
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // Hide default page indicator
                    .frame(width: geometry.size.width, height: 220) // Fixed height for image slider
                    
                    // Custom page indicator dots
                    VStack {
                        Spacer()
                        HStack(spacing: 5) { // Customize the spacing between indicators
                            ForEach(0..<listItem.mainItemImages.count, id: \.self) { index in
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
                Text(listItem.name)
                    .font(Font.custom("Baskerville", size: 12))
                    .foregroundColor(.black)
                    .padding(.top, 10)
                
                // Item price
                Text(String(describing: listItem.price))
                    .font(Font.custom("Baskerville", size: 14).weight(.semibold))
                    .foregroundColor(.black)
                    .padding(.top, 2)
            }
            .frame(width: geometry.size.width) // Dynamic width, fixed height
        }
        .frame(height: 270)
    }
}

#Preview {
    
    @Previewable @Namespace var animation
    
    var item = TrendingProduct2(images: ["Bouquet1", "Bouquet1", "Bouquet1"], itemName: "Rectangular Acrylic 061", itemPrice: "AED 365", isCustomizable: true)
    
    ListingItemView(
        listItem: globalListingScreenItem,
        animation: animation
    )
}

