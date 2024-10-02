//
//  DetailBannerView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 26/09/2024.
//

import SwiftUI

struct DetailBannerView<Space: Hashable>: View {
    let images: [String]  // Image names or URLs
    @State private var currentIndex = 0
    
    let coordinateSpace: Space
    let defaultHeight: CGFloat
    
    // State to show the navigation to full-screen image view
    @State private var isNavigatingToFullImage = false
    
    var body: some View {
        GeometryReader { proxy in
            let offset = offset(for: proxy)
            let heightModifier = heightModifier(for: proxy)
            
            ZStack(alignment: .bottom) {
                TabView(selection: $currentIndex) {
                    ForEach(0..<images.count, id: \.self) { index in
                        Image(images[index])
                            .resizable()
                            .scaledToFit()
                            .frame(width: proxy.size.width, height: defaultHeight)
                            .clipped()
                            .tag(index)
                            .onTapGesture {
                                isNavigatingToFullImage.toggle()  // Trigger navigation to full-screen image view
                            }
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
                .padding(.bottom, 25)
            }
            .background(Constants.imageBG)
            .edgesIgnoringSafeArea(.horizontal)
            .frame(
                width: proxy.size.width,
                height: proxy.size.height + heightModifier
            )
            .offset(y: offset)
        }
        .frame(height: defaultHeight)
        // Navigation to the full-screen image view
        .background(
            NavigationLink(
                destination: DetailFullImageView(images: images, selectedIndex: currentIndex),
                isActive: $isNavigatingToFullImage,
                label: { EmptyView() }
            )
            .hidden()  // Hide the navigation link, it will be triggered programmatically
        )
    }
    
    private func offset(for proxy: GeometryProxy) -> CGFloat {
        let frame = proxy.frame(in: .named(coordinateSpace))
        if frame.minY < 0 {
            return -frame.minY * 0.65
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
        NavigationView {
            // Define a named coordinate space for the GeometryReader
            GeometryReader { geometry in
                ScrollView {
                    VStack {
                        // Using DetailBannerView in a named coordinate space for the GeometryReader
                        DetailBannerView(
                            images: ["Bouquet1", "Test", "Bouquet1"],  // Example images
                            coordinateSpace: "bannerCoordinateSpace",  // Coordinate space name
                            defaultHeight: 600  // Example height for the banner
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

