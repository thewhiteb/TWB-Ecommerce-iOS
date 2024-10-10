//
//  DetailBannerView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 26/09/2024.
//

import SwiftUI

struct DetailBannerView<Space: Hashable>: View {
    let item: TrendingProduct2
    @State private var currentIndex = 0
    
    let coordinateSpace: Space
    let defaultHeight: CGFloat
    
   
    var onImageTapped: (Int, [String]) -> Void
    
    var animation : Namespace.ID
    
    var body: some View {
        GeometryReader { proxy in
            let offset = offset(for: proxy)
       
            ZStack(alignment: .bottom) {
              
                TabView(selection: $currentIndex) {
                    ForEach(0..<item.images.count, id: \.self) { index in
                        Image(item.images[index])
                            .resizable()
                            .scaledToFill()
                            .frame(width: proxy.size.width, height: defaultHeight, alignment: .bottom)
                            .clipped()
                            .tag(index)
                            .onTapGesture {
                                onImageTapped(index, item.images)
                            }
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .frame(width: proxy.size.width, height: defaultHeight)
                .offset(y: offset)
                
            
                VStack {
                    Spacer()
                    
                    HStack(spacing: 8) {
                        ForEach(0..<item.images.count, id: \.self) { index in
                            Circle()
                                .fill(index == currentIndex ? Color.black : Color.gray.opacity(0.5))
                                .frame(width: 8, height: 8)
                        }
                    }
                    .padding(.bottom, 10)
                }
                
                Spacer()
            }
            .background(Color(hex: "#F5F5F5"))
            .edgesIgnoringSafeArea(.horizontal)
            .frame(
                width: proxy.size.width,
                height: proxy.size.height
            )
        }
        .frame(height: defaultHeight)
    }
    
    private func offset(for proxy: GeometryProxy) -> CGFloat {
        let frame = proxy.frame(in: .named(coordinateSpace))
        if frame.minY < 0 {
            return -frame.minY * 0.65
        }
        return 0
    }
}

struct DetailBannerViewPreview: View {
    
    @Namespace var animation
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ScrollView {
                    VStack {
                        DetailBannerView(
                            item : TrendingProduct2( images: ["2","3","2"],
                                             itemName: "Rectangular Acrylic 061",
                                             itemPrice: "AED 365",
                                             isCustomizable: true),
                            coordinateSpace: "bannerCoordinateSpace",  // Coordinate space name
                            defaultHeight: 600,
                            onImageTapped: { selectedIndex, imagesArray in
                                print("Image \(selectedIndex) was tapped")
                            },
                            animation: animation
                        )
                    }
                }
                .coordinateSpace(name: "bannerCoordinateSpace")  // Declare the named coordinate space
            }
        }
    }
}

#Preview {
    DetailBannerViewPreview()
}
