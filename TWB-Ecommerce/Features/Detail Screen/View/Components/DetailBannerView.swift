//
//  DetailBannerView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 26/09/2024.
//

import SwiftUI

struct DetailBannerView< Space: Hashable>: View {
    let images: [String]  // Image names or URLs
    @State private var currentIndex = 0
    
    let coordinateSpace: Space
    let defaultHeight: CGFloat
    
  
    var body: some View {
        GeometryReader { proxy in
            let offset = offset(for: proxy)
            let heightModifier = heightModifier(for: proxy)
            
            ZStack(alignment: .bottom) {
                
                TabView(selection: $currentIndex) {
                    ForEach(0..<images.count, id: \.self) { index in
                        Image(images[index])
                            .resizable()
                            .scaledToFill()
                            .frame(width: proxy.size.width, height: defaultHeight)
                            .clipped()
                            .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))  // Disable default indicators
                .frame(width: proxy.size.width, height: defaultHeight)
                
                // Custom page indicator dots
                HStack(spacing: 8) {
                    ForEach(0..<images.count, id: \.self) { index in
                        Circle()
                            .fill(index == currentIndex ? Color.black : Color.gray.opacity(0.5))  // Custom indicator colors
                            .frame(width: 8, height: 8)
                    }
                }
                .padding(.bottom, 10)
            }
            
            .edgesIgnoringSafeArea(.horizontal)
            .frame(
                width: proxy.size.width,
                height: proxy.size.height + heightModifier
            )
            .offset(y: offset)
        }.frame(height: defaultHeight)
    }
    
    private func offset(for proxy: GeometryProxy) -> CGFloat {
        let frame = proxy.frame(in: .named(coordinateSpace))
        if frame.minY < 0 {
            return -frame.minY * 0.7
        }
        return -frame.minY
    }
    
    private func heightModifier(for proxy: GeometryProxy) -> CGFloat {
        let frame = proxy.frame(in: .named(coordinateSpace))
        return max(0, frame.minY)
    }
    
}

struct DetailBannerViewPreview: View {
    var body: some View {
        // Define a named coordinate space for the GeometryReader
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    // Using DetailBannerView in a named coordinate space for the GeometryReader
                    DetailBannerView(
                        images: ["DetailBanner", "DetailBanner", "DetailBanner"],  // Example images
                        coordinateSpace: "bannerCoordinateSpace",  // Coordinate space name
                        defaultHeight: 600  // Example height for the banner
                    )
        
                }
            }
            .coordinateSpace(name: "bannerCoordinateSpace")  // Declare the named coordinate space
        }
    }
}

// Preview
#Preview {
    DetailBannerViewPreview()
}
