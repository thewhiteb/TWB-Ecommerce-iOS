//
//  DetailScreenTabComponent.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 14/10/2024.
//

import SwiftUI

struct DetailScreenTabComponent: View {
    var animation: Namespace.ID
    @Binding var isDragDisable: Bool
    @Binding var isDetailViewActive: Bool
    @Binding var isListViewActive: Bool
    @Binding var isTabBarEnable: Bool
    var selectedItem: TrendingProduct2
    var onImageTapped: (Int, [String]) -> Void
    @Binding var dragDetailOffset: CGFloat
    
    var body: some View {
        DetailScreenView(
            animation: animation,
            isDragDisable: isDragDisable,
            item: selectedItem,
            onBackButtonPressed: {
                withAnimation {
                    isTabBarEnable = isListViewActive ? false : true
                    isDetailViewActive = false
                }
            },
            onImageTapped: onImageTapped
        )
        .offset(x: dragDetailOffset > 0 ? dragDetailOffset : 0)
        .gesture(
            DragGesture()
                .onChanged { value in
                    isDragDisable = true
                    dragDetailOffset = value.translation.width
                }
                .onEnded { value in
                    if value.translation.width > UIScreen.main.bounds.width / 3 {
                        withAnimation {
                            dragDetailOffset = 0
                            isDetailViewActive = false
                        }
                    } else {
                        withAnimation {
                            isDragDisable = false
                            dragDetailOffset = 0
                        }
                    }
                }
        )
    }
}

