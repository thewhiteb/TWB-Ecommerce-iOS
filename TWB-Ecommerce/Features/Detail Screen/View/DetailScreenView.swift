//
//  DetailScreenView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 25/09/2024.
//


import SwiftUI

struct DetailScreenView: View {
    @State private var headerOpacity: Double = 0.0  // Track the header opacity
    @State private var bannerHeight: CGFloat = 0.7 * UIScreen.main.bounds.height  // Initial banner height
    
    private enum CoordinateSpaces {
        case scrollView
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView(showsIndicators: false) {
                GeometryReader { geo in
                    DetailBannerView(
                        images: ["Bouquet1", "Test", "Bouquet1"],
                        coordinateSpace: CoordinateSpaces.scrollView,
                        defaultHeight: bannerHeight
                    )
                }
                .frame(height: bannerHeight)

                // Scroll content below the banner
                DetailBottomView(bannerHeight: bannerHeight, headerOpacity: $headerOpacity)
                    .background(Color.white)
            }
            .coordinateSpace(name: CoordinateSpaces.scrollView)  // Make sure the coordinate space is properly set
            
            // Header that appears with scrolling
            DetailHeaderView(headerOpacity: $headerOpacity)
        }
        .navigationBarBackButtonHidden(true) // Hide back button
        .edgesIgnoringSafeArea(.top)
    }
}
//Test

#Preview {
    DetailScreenView()
}

