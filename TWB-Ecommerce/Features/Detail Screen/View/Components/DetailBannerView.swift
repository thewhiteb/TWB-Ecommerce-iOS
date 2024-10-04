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
    
    // Callback for image tap with the selected index
    var onImageTapped: (Int, [String]) -> Void
    
    var body: some View {
        GeometryReader { proxy in
            let offset = offset(for: proxy)
            let heightModifier = heightModifier(for: proxy)
            
            ZStack(alignment: .bottom) {
                Spacer()
                
                TabView(selection: $currentIndex) {
                    ForEach(0..<images.count, id: \.self) { index in
                        Image(images[index])
                            .resizable()
                            .scaledToFit()  // Fit image to its available space while preserving aspect ratio
                            .frame(width: proxy.size.width, height: defaultHeight, alignment: .bottom)  // Align image to the bottom of the view
                            .clipped()
                            .tag(index)
                            .onTapGesture {
                                // Call the callback with the tapped image index and images array
                                onImageTapped(index, images)
                            }
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))  // Disable default indicators
                .frame(width: proxy.size.width, height: defaultHeight)
                .offset(y: offset)  // Adjust offset as the user scrolls
                
                // Custom page indicator dots aligned near the bottom
                VStack {
                    Spacer()
                    
                    HStack(spacing: 8) {
                        ForEach(0..<images.count, id: \.self) { index in
                            Circle()
                                .fill(index == currentIndex ? Color.black : Color.gray.opacity(0.5))  // Custom indicator colors
                                .frame(width: 8, height: 8)
                        }
                    }
                    .padding(.bottom, 10)  // Add some padding at the bottom of the indicator
                }
            }
            .background(Color(hex: "#F5F5F5"))  // Example background color
            .edgesIgnoringSafeArea(.horizontal)
            .frame(
                width: proxy.size.width,
                height: proxy.size.height + heightModifier
            )
        }
        .frame(height: defaultHeight)
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
            GeometryReader { geometry in
                ScrollView {
                    VStack {
                        DetailBannerView(
                            images: ["Bouquet1", "Test", "Bouquet1"],  // Example images
                            coordinateSpace: "bannerCoordinateSpace",  // Coordinate space name
                            defaultHeight: 600,
                            onImageTapped: { selectedIndex, imagesArray in
                                print("Image \(selectedIndex) was tapped")
                            }
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
