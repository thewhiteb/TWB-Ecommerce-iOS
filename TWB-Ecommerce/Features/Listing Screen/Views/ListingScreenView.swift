//
//  ListingScreenView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 16/09/2024.
//

import SwiftUI

struct ListingScreenView: View {
    
    // Define the grid layout: 2 columns with flexible widths
    private let gridItems = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
    ]
    
    // Sample list of items
    @State private var items: [TrendingProduct] = [
        TrendingProduct(images: ["Bouquet1","Bouquet1","Bouquet1"], itemName: "Rectangular Acrylic 061", itemPrice: "AED 365", isCustomizable: true),
        TrendingProduct(images: ["Bouquet1","Bouquet1","Bouquet1"], itemName: "Round Bouquet", itemPrice: "AED 250", isCustomizable: true),
        TrendingProduct(images: ["Bouquet1","Bouquet1","Bouquet1"], itemName: "Elegant Roses", itemPrice: "AED 180", isCustomizable: false),
        TrendingProduct(images: ["Bouquet1","Bouquet1","Bouquet1"], itemName: "Luxury Tulips", itemPrice: "AED 500", isCustomizable: false),
        TrendingProduct(images: ["Bouquet1","Bouquet1","Bouquet1"], itemName: "Rectangular Acrylic 075", itemPrice: "AED 365", isCustomizable: true),
        TrendingProduct(images: ["Bouquet1","Bouquet1","Bouquet1"], itemName: "Rectangular Acrylic 090", itemPrice: "AED 365", isCustomizable: true)
    ]
    
    // MARK: - Properties
    var safeArea: EdgeInsets
    var size: CGSize
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                // MARK: - Artwork
                Artwork()
                
                VStack {
                    
                    
                    // MARK: - Album View
                    GridViewItems()
                }
                .padding(.top, 10)
                .zIndex(0)
            }
            .overlay(alignment: .top) {
                HeaderView()
            }
        }
        .coordinateSpace(name: "SCROLL")
    }
    
    @ViewBuilder
    func Artwork() -> some View {
        let height = size.height * 0.45
        GeometryReader { proxy in
            let size = proxy.size
            let minY = proxy.frame(in: .named("SCROLL")).minY
            let progress = minY / (height * (minY > 0 ? 0.7 : 0.9))
            
            Image("Featured_Banner1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size.width, height: size.height + (minY > 0 ? minY : 0))
                .clipped()
                .overlay(content: {
                    ZStack(alignment: .bottom) {
                        // MARK: - Gradient Overlay
                        Rectangle()
                            .fill(
                                .linearGradient(colors: [
                                    .white.opacity(0 - progress),
                                    .white.opacity(0.1 - progress),
                                    .white.opacity(0.1 - progress),
                                    .white.opacity(0.1 - progress),
                                    .white.opacity(0.2 - progress),
                                    .white.opacity(0.2 - progress),
                                    .white.opacity(0.3 - progress),
                                    .white.opacity(0.5 - progress),
                                ], startPoint: .top, endPoint: .bottom)
                            )
                            .opacity(minY < 0 ? 1 : 0)  // Show gradient only when scrolling starts
                        
                        VStack(spacing: 0) {
                            // Content for the artwork overlay
                        }
                        .opacity(1 + (progress > 0 ? -progress : progress))
                        .offset(y: minY < 0 ? minY : 0)
                    }
                })
                .offset(y: -minY)
        }
        .frame(height: height + safeArea.top)
    }
    
    @ViewBuilder
    func GridViewItems() -> some View {
        LazyVGrid(columns: gridItems, spacing: 15) {
            ForEach(items, id: \.self) { item in
                ListingItemView(
                    images: item.images,
                    itemName: item.itemName,
                    itemPrice: item.itemPrice,
                    isCustomizable: item.isCustomizable
                )
            }
        }
        .padding(.horizontal, 15)
    }
    
    
    // MARK: - Header View
    @ViewBuilder
    func HeaderView() -> some View {
        GeometryReader { proxy in
            let minY = proxy.frame(in: .named("SCROLL")).minY
            let height = size.height * 0.45
            let progress = minY / (height * (minY > 0 ? 0.5 : 0.8))
            let titleProgress =  minY / height
            
            HStack(spacing: 15) {
                Button {
                    // Back button action
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title3)
                        .foregroundColor(.black)
                }
                Spacer(minLength: 0)
                
                Button {
                    // More options button action
                } label: {
                    Image(systemName: "ellipsis")
                        .font(.title3)
                        .foregroundColor(.black)
                }
            }
            .overlay(content: {
                Text("Fally Ipupa")
                    .fontWeight(.semibold)
                    .offset(y: -titleProgress > 0.85 ? 0 : 45)
                    .clipped()
                    .animation(.easeOut(duration: 0.25), value: -titleProgress > 0.75)
            })
            .padding(.top, safeArea.top + 10)
            .padding([.horizontal, .bottom], 15)
            .background(
                Color.white
                    .opacity(-progress > 1 ? 1 : 0)
            )
            .offset(y: -minY)
        }
        .frame(height: 35)
    }
}

#Preview {
    GeometryReader {
        let safeArea = $0.safeAreaInsets
        let size = $0.size
        ListingScreenView(safeArea: safeArea, size: size)
            .ignoresSafeArea(.container, edges: .top)
    }
}
