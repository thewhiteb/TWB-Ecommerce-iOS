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
        VStack(spacing :0) {
            
            ZStack(alignment: .top) {
                ScrollView(showsIndicators: false) {
                    GeometryReader { geo in
                        DetailBannerView(
                            images: ["2", "3", "2"],
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
                    DetailBottomView(bannerHeight: bannerHeight, headerOpacity: $headerOpacity, itemName: itemName)
                        .background(Color.white)
                }
                .coordinateSpace(name: CoordinateSpaces.scrollView)
                
                DetailHeaderView(headerOpacity: $headerOpacity, onBackButtonPressed: {
                    onBackButtonPressed()
                })
            }
            
            VStack {
                HStack{
                    AddToBagButton(action: {
                        isCustomizeDone.toggle()
                    }, text: "Add to Bag", imageName: "bag")
                    
                }
                .padding(.horizontal,16)
                .padding(.vertical, 12)
                .background(Color.white)
            }
            .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 1)
            
        }
        .background(Color.white)
        .sheet(isPresented: $isCustomizeDone) {
            DetailMainSheet()
                .presentationDetents([.fraction(0.7), .large])
                .presentationDragIndicator(.visible)
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
