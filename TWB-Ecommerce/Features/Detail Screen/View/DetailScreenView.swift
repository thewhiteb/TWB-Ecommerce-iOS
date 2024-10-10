//
//  DetailScreenView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 25/09/2024.
//


import SwiftUI

struct DetailScreenView: View {
    @State private var headerOpacity: Double = 0.0
    @State private var bannerHeight: CGFloat = 0.65 * UIScreen.main.bounds.height
    @State private var isCustomizeDone = false
    var animation: Namespace.ID
    
    @State var scale: CGFloat = 1
    
    private enum CoordinateSpaces {
        case scrollView
    }
    
    var item: TrendingProduct2
    var onBackButtonPressed: () -> Void
    
    var onImageTapped: (Int, [String]) -> Void
    
    @State private var isDragging = false
    
    var body: some View {
        
        ZStack(alignment: .top) {
            // Fixed header at the top
            DetailHeaderView(headerOpacity: $headerOpacity, onBackButtonPressed: {
                onBackButtonPressed()
            })
            .zIndex(1)
            // Main ScrollView for content
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                    DetailBannerView(
                        item : item,
                        coordinateSpace: CoordinateSpaces.scrollView,
                        defaultHeight: bannerHeight,
                        onImageTapped: { selectedIndex, imagesArray in
                            onImageTapped(selectedIndex, imagesArray)
                        },
                        animation: animation
                    )
                    .frame(height: bannerHeight)
                    
                    // Scroll content below the banner
                    DetailBottomView(
                        animation: animation,
                        bannerHeight: bannerHeight,
                        headerOpacity: $headerOpacity,
                        itemName: item.itemName
                    )
                    .background(Color.white)
                }
            }
            .scrollDisabled(isDragging)
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
        }
        .gesture(
            DragGesture(minimumDistance: 0)
                .onChanged { value in
                    print("Value : \(value)")
                    if value.translation.height > 0 {
                        isDragging = true
                        let scale = value.translation.height / UIScreen.main.bounds.height
                        print(" Scale Value : \(scale)")
                        if 1 - scale > 0.7 {
                            self.scale = 1 - scale
                        }
                    }
                }
                .onEnded { value in
                    if value.translation.height > 0 {
                        isDragging = false
                        withAnimation(.spring()) {
                            if scale < 0.9 {
                                onBackButtonPressed()
                            }
                            scale = 1
                        }
                    }
                }
        )
        .matchedGeometryEffect(id: item.id, in: animation)
        .background(Color.white)
        .scaleEffect(scale)
        .ignoresSafeArea(.container, edges: .top)
    }
}

// Preview
#Preview {
    @Previewable @Namespace var animation
    
    var item =  TrendingProduct2(images: ["Bouquet1", "Bouquet1", "Bouquet1"], itemName: "Rectangular Acrylic 061", itemPrice: "AED 365", isCustomizable: true)
    
    
    DetailScreenView(animation: animation,item: item, onBackButtonPressed: {
        print("Back button pressed")
    }, onImageTapped: { selectedIndex, imagesArray in
        print("Selected image at index \(selectedIndex) with array \(imagesArray)")})
}
