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
    var animation : Namespace.ID
    
    @State var scale : CGFloat = 1
    
    
    private enum CoordinateSpaces {
        case scrollView
    }
    
    var item: TrendingProduct  // Accept the itemName
    var onBackButtonPressed: () -> Void
    
    var onImageTapped: (Int, [String]) -> Void
    
    @State private var isDragging = false
    
    var body: some View {
        VStack(spacing :0) {
            
            ZStack(alignment: .top) {
                ScrollView(showsIndicators: false) {        
                        DetailBannerView(
                            images: ["2", "3", "2"],
                            coordinateSpace: CoordinateSpaces.scrollView,
                            defaultHeight: bannerHeight,
                            onImageTapped: { selectedIndex, imagesArray in
                                onImageTapped(selectedIndex, imagesArray)
                            },
                            animation: animation
                        )
                    .frame(height: bannerHeight)
                    
                    Spacer()
                    
                    // Scroll content below the banner
                    DetailBottomView(animation : animation, bannerHeight: bannerHeight, headerOpacity: $headerOpacity, itemName: item.itemName)
                        .background(Color.white)
                }
                .scrollDisabled(isDragging)
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
                    if value.translation.height > 0 {
                        isDragging = true
                        let scale = value.translation.height / UIScreen.main.bounds.height
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
    }
    
    
    
}

//// Preview
//#Preview {
//    DetailScreenView(itemName: "Sample Item", onBackButtonPressed: {
//        print("Back button pressed")
//    }, onImageTapped: { selectedIndex, imagesArray in
//        print("Selected image at index \(selectedIndex) with array \(imagesArray)")})
//}
