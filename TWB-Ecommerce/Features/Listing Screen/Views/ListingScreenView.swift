//
//  ListingScreenView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 16/09/2024.
//

import SwiftUI

struct ListingScreenView: View {
    
    var animation : Namespace.ID
    
    @State private var scale: CGFloat = 1.0
    @State private var isSortOptionClicked = false
    @State private var isFilterOptionClicked = false
    
    var isDragDisable: Bool
    var title: String
    var onItemSelected: (ListingScreenItem) -> Void
    var onBackButtonPressed: () -> Void
    var items: [ListingScreenItem]
    
    var body: some View {
        GeometryReader { geometry in
            let safeArea = geometry.safeAreaInsets
            let size = geometry.size
            
            ZStack {
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack (spacing :0) {
                        ArtWork(safeArea: safeArea, size: size)
                        
                        VStack (spacing :0) {
                            
                            // Since We ignored Top Edge
                            GeometryReader { proxy in
                                let minY = proxy.frame(in: .named("SCROLL")).minY
                                
                                VStack {
                                    HStack {
                                        Spacer()
                                        Text(title)
                                            .font(
                                                Font.custom("Baskerville", size: 22)
                                            )
                                            .fontWeight(.semibold)
                                            .foregroundColor(.black)
                                            .padding(.top, 30)
                                            .offset(y: minY < 43 ? -(minY - (43)) : 0)
                                        Spacer()
                                    }
                                    TabListSmallView(minY: minY)
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                        .offset(y: minY < 43 ? -(minY - (43)) : 0)
                                
                                }
                                .background(Constants.white)
                            }
                            .zIndex(1)
                            
                            BottomView( onItemSelected: { selectedItem in
                                onItemSelected(selectedItem)  // Handle item selection
                            }, items: items, animation : animation )
                            
                        }
                        .background(Color.white)
                        
                    }
                    .overlay(alignment: .top) {
                        HeaderView(title: title, safeArea: safeArea, size: size,
                                       onBackButtonPressed: {
                            onBackButtonPressed()
                        })
                    }
                }
                .scrollDisabled(isDragDisable)
                .coordinateSpace(name: "SCROLL")
                
                
                VStack {
                    Spacer() // Push the button to the bottom
                    HStack(spacing: 0) {
                        Button {
                            // Sort action here
                            isSortOptionClicked = true
                        } label: {
                            HStack(spacing: 0) {
                                Text("Sort")
                                    .font(
                                        Font.custom("Lato", size: 14)
                                            .weight(.bold)
                                    )
                                    .foregroundColor(.white)
                                Image("swap_vert")
                            }
                        }
                        .padding(.horizontal, 10)
                        .padding(.vertical, 12)
                        .frame(width: 90)
                        
                        Rectangle()
                            .frame(width: 1, height: 20)
                            .foregroundColor(.white)
                        
                        Button {
                            // Filters action here
                            isFilterOptionClicked = true
                        } label: {
                            HStack(spacing: 0) {
                                Text("Filters")
                                    .font(
                                        Font.custom("Lato", size: 14)
                                            .weight(.bold)
                                    )
                                    .foregroundColor(.white)
                                Image("filter_list")
                            }
                        }
                        .padding(.horizontal, 10)
                        .padding(.vertical, 7)
                        .frame(width: 90)
                    }
                    .background(Color.black)
                    .padding(.horizontal, 20) // Add horizontal margin
                    .padding(.vertical, 10) // Add vertical padding to the whole button view
                }
                .padding(.bottom, 30) // Add margin from the bottom
                .ignoresSafeArea()
            }
            .sheet(isPresented: $isSortOptionClicked) {
                SortSheet()
                    .presentationDetents([.fraction(0.5), .medium])
            }
            .sheet(isPresented: $isFilterOptionClicked) {
                FiltersSheet()
                    .presentationDetents([.fraction(0.7), .large])
            }
            .ignoresSafeArea(.container, edges: .top)
        }
    }
}

#Preview {
//    ListingScreenView(
//        title: "Shop By Style",
//        onItemSelected: { item in
//            print("Selected item: \(item)")
//        },
//        onBackButtonPressed: {
//            print("Back button pressed")
//        }
//    )
    @Previewable @Namespace var animation
    ListingScreenView(
        animation: animation,
        isDragDisable: true,
        title: "Shop By Style",
        onItemSelected: { item in
            print(item)
        },
        onBackButtonPressed: { }, items: []
    )
}
