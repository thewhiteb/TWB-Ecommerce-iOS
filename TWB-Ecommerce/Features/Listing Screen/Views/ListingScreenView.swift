//
//  ListingScreenView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 16/09/2024.
//

import SwiftUI

struct ListingScreenView: View {
    
    @Binding var title: String
    
    // Define the grid layout: 2 columns with flexible widths
    private let gridItems = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
    ]
    
    @State private var scale: CGFloat = 1.0
    
    // Sample list of items
    @State private var items: [TrendingProduct] = [
        TrendingProduct(images: ["Bouquet1","Bouquet1","Bouquet1"], itemName: "Rectangular Acrylic 061", itemPrice: "AED 365", isCustomizable: true),
        TrendingProduct(images: ["Bouquet1","Bouquet1","Bouquet1"], itemName: "Round Bouquet", itemPrice: "AED 250", isCustomizable: true),
        TrendingProduct(images: ["Bouquet1","Bouquet1","Bouquet1"], itemName: "Elegant Roses", itemPrice: "AED 180", isCustomizable: false),
        TrendingProduct(images: ["Bouquet1","Bouquet1","Bouquet1"], itemName: "Luxury Tulips", itemPrice: "AED 500", isCustomizable: false),
        TrendingProduct(images: ["Bouquet1","Bouquet1","Bouquet1"], itemName: "Rectangular Acrylic 075", itemPrice: "AED 365", isCustomizable: true),
        TrendingProduct(images: ["Bouquet1","Bouquet1","Bouquet1"], itemName: "Rectangular Acrylic 090", itemPrice: "AED 365", isCustomizable: true)
    ]
    
    var safeArea: EdgeInsets
    var size: CGSize
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                
                Artwork()
                
                
                
                Text(title)
                    .font(
                        Font.custom("Baskerville", size: 20)
                    )
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .padding(.top,30)
                
                
                
                VStack {
                    // Since We ignored Top Edge
                    GeometryReader{ proxy in
                        let minY = proxy.frame(in: .named("SCROLL")).minY - safeArea.top
                        
                        VStack {
                            
                            if minY > 5 {
                                TabListView(scale: minY < 45 ? max(minY / 45, 0.5) : 1) // Scale from 1 to 0.5
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .offset(y: minY < 45 ? -(minY - 45) : 1)
                                    .opacity(minY < 45 ? Double(minY / 45) : 1)  // Adjust opacity based on minY
                                    .transition(.move(edge: .top).combined(with: .opacity))  // Transition for the move and opacity
                                    .animation(.easeInOut, value: minY)  // Animate based on minY changes
                                    .onAppear {
                                        print("minY onAppear: \(minY)") // This will print when the view appears
                                    }
                                    .onChange(of: minY) { newValue in
                                        print("minY changed to: \(newValue)") // This will print whenever minY changes
                                    }
                                
                            } else {
                                
                                TabListSmallView()
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .offset(y: -(minY - 45))
                                
                            }
                        }
                    }
                    .frame(height: 50)
                    .zIndex(1)
                    
                    
                    VStack{
                        Text("Showing 156 item(s)")
                            .font(Font.custom("Baskerville", size: 10))
                            .foregroundColor(Color(red: 0.35, green: 0.35, blue: 0.35))
                            .padding(.top,70 * scale)
                        
                        GridViewItems()
                            .padding(.top,30)
                    }
                    .padding(.top, 70 * scale)
                    .zIndex(0)
                }
                
            }
            .overlay(alignment: .top) {
                HeaderView()
            }
        }
        .coordinateSpace(name: "SCROLL")
    }
    
    @ViewBuilder
    func HeaderView() -> some View {
        GeometryReader { proxy in
            let minY = proxy.frame(in: .named("SCROLL")).minY
            let height = size.height * 0.45
            let progress = minY / (height * (minY > 0 ? 0.5 : 1))
            let titleProgress = minY / height
            
            HStack(spacing: 15) {
                Button {
                    // Back button action
                } label: {
                    Image("back")
                        .font(.title3)
                        .foregroundColor(.black)
                }
                Spacer(minLength: 0)
                
                Button {
                    // More options button action
                } label: {
                    Image("Search")
                        .font(.title3)
                        .foregroundColor(.black)
                }
            }
            .overlay(content: {
                Text(title)
                    .font(Font.custom("Baskerville", size: 20))
                    .fontWeight(.semibold)
                    .opacity(-titleProgress > 1 ? 1 : 0) // Adjust opacity to control when the text fades in
                    .offset(y: -titleProgress > 1 ? 0 : 45)
                    .animation(.easeOut(duration: 0.25), value: -titleProgress > 0.85)
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
    
    
    @ViewBuilder
    func Artwork() -> some View {
        let height = size.height * 0.45
        GeometryReader { proxy in
            let size = proxy.size
            let minY = proxy.frame(in: .named("SCROLL")).minY
            let progress = minY / (height * (minY > 0 ? 0.7 : 0.9))
            
            VStack{
                
                Image("Featured_Banner1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width, height: size.height + (minY > 0 ? minY : 0))
                    .clipped()
                    .overlay(content: {
                        ZStack(alignment: .bottom) {
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
                                .opacity(minY < 0 ? 1 : 0)
                            
                        }
                    })
                    .offset(y: -minY)
                
            }
            
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
    
    
    
}

#Preview {
    GeometryReader {
        let safeArea = $0.safeAreaInsets
        let size = $0.size
        @State var text = "Acrylic Boxes"
        ListingScreenView(title: $text ,safeArea: safeArea, size: size)
            .ignoresSafeArea(.container, edges: .top)
    }
}
