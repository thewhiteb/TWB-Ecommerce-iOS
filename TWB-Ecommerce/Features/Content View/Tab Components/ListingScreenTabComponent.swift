//
//  ListingScreenTabComponent.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 14/10/2024.
//

import SwiftUI

struct ListingScreenTabComponent: View {
    var animation: Namespace.ID
    @Binding var isDragDisable: Bool
    @Binding var isListingViewActive: Bool
    @Binding var isTabBarEnable: Bool
    var onItemSelected: (TrendingProduct2) -> Void
    @Binding var dragOffset: CGFloat
    
    var body: some View {
        ListingScreenView(
            animation: animation,
            isDragDisable: isDragDisable,
            title: "Shop By Style",
            onItemSelected: { item in
                onItemSelected(item)
            },
            onBackButtonPressed: {
                withAnimation {
                    isListingViewActive = false
                    isTabBarEnable = true
                }
            }
        )
        .offset(x: dragOffset > 0 ? dragOffset : 0)
        .gesture(
            DragGesture()
                .onChanged { value in
                    isDragDisable = true
                    dragOffset = value.translation.width
                }
                .onEnded { value in
                    if value.translation.width > UIScreen.main.bounds.width / 3 {
                        withAnimation {
                            dragOffset = 0
                            isListingViewActive = false
                            isTabBarEnable = true
                        }
                    } else {
                        withAnimation {
                            isDragDisable = false
                            dragOffset = 0
                        }
                    }
                }
        )
    }
}
