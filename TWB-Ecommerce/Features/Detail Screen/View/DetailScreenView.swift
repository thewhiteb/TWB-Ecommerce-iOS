//
//  DetailScreenView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 25/09/2024.
//

import SwiftUI

struct DetailScreenView: View {
    @State private var headerOpacity: Double = 0.0
    @State private var bannerHeight: CGFloat = UIScreen.main.bounds.height * 0.62
    @State private var isCustomizeDone = false
    @State private var showDetails = true  // State to control when to show details
    @State private var backgroundOpacity: Double = 0.0
    var animation: Namespace.ID
    
    
    private enum CoordinateSpaces {
        case scrollView
    }
    
    var isDragDisable: Bool
    var item: TrendingProduct2
    var onBackButtonPressed: () -> Void
    var onImageTapped: (Int, [String]) -> Void
    
    
    var body: some View {
        ZStack(alignment: .top) {
            
            // Fixed header at the top
            DetailHeaderView(headerOpacity: $headerOpacity, onBackButtonPressed: {
                withAnimation {
                    onBackButtonPressed()
                }
                
            },
                             showDetails: $showDetails)
            .zIndex(1)
            
            // Main ScrollView for content
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                    DetailBannerView(
                        item: item,
                        coordinateSpace: CoordinateSpaces.scrollView,
                        defaultHeight: bannerHeight,
                        onImageTapped: { selectedIndex, imagesArray in
                            onImageTapped(selectedIndex, imagesArray)
                        },
                        animation: animation
                    )
                    .frame(height: bannerHeight)
                    
                    
                    
                    DetailBottomView(
                        animation: animation,
                        bannerHeight: bannerHeight,
                        headerOpacity: $headerOpacity,
                        showDetails: $showDetails,
                        itemName: item.itemName
                    )
                    .background(Color.white)
                    
                }
                
            }
            .scrollDisabled(isDragDisable)
            .coordinateSpace(name: CoordinateSpaces.scrollView)
            
            
            VStack {
                Spacer()
                HStack {
                    AddToBagButton(action: {
                        isCustomizeDone.toggle()
                    }, text: "Add to Bag", imageName: "bag")
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                .background(Color.white)
                .sheet(isPresented: $isCustomizeDone) {
                    DetailMainSheet()
                        .presentationDetents([.fraction(0.7), .large])
                        .presentationDragIndicator(.visible)
                }
            }
            .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 1)
            .transition(.move(edge: .bottom))  // Move in from bottom
            .animation(.easeInOut(duration: 0.4), value: showDetails)
        }
        
        .background(Color.white.opacity(backgroundOpacity))
        .ignoresSafeArea(.container, edges: .top)
        
    }
}

// Preview
#Preview {
    @Previewable @Namespace var animation
    
    var item =  TrendingProduct2(images: ["Bouquet1", "Bouquet1", "Bouquet1"], itemName: "Rectangular Acrylic 061", itemPrice: "AED 365", isCustomizable: true)
    
    
    DetailScreenView(animation: animation,isDragDisable : true, item: item, onBackButtonPressed: {
        print("Back button pressed")
    }, onImageTapped: { selectedIndex, imagesArray in
        print("Selected image at index \(selectedIndex) with array \(imagesArray)")})
}
