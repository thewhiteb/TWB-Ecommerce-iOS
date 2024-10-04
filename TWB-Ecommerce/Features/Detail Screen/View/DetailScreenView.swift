//
//  DetailScreenView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 25/09/2024.
//


import SwiftUI

struct DetailScreenView: View {
    @State private var headerOpacity: Double = 0.0  // Track the header opacity
    @State private var bannerHeight: CGFloat = 0.65 * UIScreen.main.bounds.height  // Initial banner height
    @State private var isCustomizeDone = false
    
    
    private enum CoordinateSpaces {
        case scrollView
    }
    
    var itemName: String  // Accept the itemName
    var onBackButtonPressed: () -> Void
    
    var onImageTapped: (Int, [String]) -> Void
    
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView(showsIndicators: false) {
                GeometryReader { geo in
                    DetailBannerView(
                        images: ["Bouquet1", "Test", "Bouquet1"],
                        coordinateSpace: CoordinateSpaces.scrollView,
                        defaultHeight: bannerHeight,
                        onImageTapped: { selectedIndex, imagesArray in
                            onImageTapped(selectedIndex, imagesArray)
                        }
                    )
                }
                .frame(height: bannerHeight)
                
                Spacer()
                
                // Scroll content below the banner
                DetailBottomView(bannerHeight: bannerHeight, headerOpacity: $headerOpacity, onAddToBagClicked: { success in
                    isCustomizeDone = success
                }, itemName: itemName)
                .background(Color.white)
            }
            .coordinateSpace(name: CoordinateSpaces.scrollView)
            
            // Header that appears with scrolling
            DetailHeaderView(headerOpacity: $headerOpacity, onBackButtonPressed: {
                onBackButtonPressed()
            })
            
        }
        .background(Color.white)
        .sheet(isPresented: $isCustomizeDone) {
            DetailMainSheet()
                .presentationDetents([.fraction(0.7), .large])
        }
    }
}

// Preview
#Preview {
    DetailScreenView(itemName: "Sample Item", onBackButtonPressed: {
        print("Back button pressed")
    }, onImageTapped: { selectedIndex, imagesArray in
        print("Selected image at index \(selectedIndex) with array \(imagesArray)")})
}
