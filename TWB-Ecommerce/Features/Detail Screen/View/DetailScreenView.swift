//
//  DetailScreenView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 25/09/2024.
//

import SwiftUI

struct DetailScreenView: View {
    @State private var headerOpacity: Double = 0.0
    @State private var bannerHeight: CGFloat = UIScreen.main.bounds.height * 0.65
    @State private var isCustomizeDone = false
    @State private var showDetails = false  // State to control when to show details
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
                    showDetails = false
                    withAnimation {
                        bannerHeight = 220
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
            .scrollDisabled(isDragging)
            .coordinateSpace(name: CoordinateSpaces.scrollView)
            
            if showDetails {
                // Add to Bag Button
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
            
        }
        .onAppear {
            // Expand image to full screen height after 0.3 seconds
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                withAnimation(.spring(response: 0.3, dampingFraction: 1, blendDuration: 0.4)) {
                    showDetails = true
                }
            }
        }
        .gesture(
            DragGesture(minimumDistance: 0)
                .onChanged { value in
                    print("Value: \(value)")
                    if value.translation.height > 0 {
                        isDragging = true
                        let scale = value.translation.height / UIScreen.main.bounds.height
                        print("Scale Value: \(scale)")
                        if 1 - scale > 0.7 {
                            self.scale = 1 - scale
                        }
                    }
                }
                .onEnded { value in
                    if value.translation.height > 0 {
                        isDragging = false
                        withAnimation(.spring(response: 0.4, dampingFraction: 1, blendDuration: 0.4)) {
                            if scale < 0.9 {
                                showDetails = false
                                withAnimation {
                                    bannerHeight = 220
                                    onBackButtonPressed()
                                }
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
