//
//  BottomNavigationBar.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 14/10/2024.
//

import SwiftUI

struct BottomNavigationBar: View {
    @Binding var selectedTab: Int
    @Binding var isTabBarEnable: Bool
    
    var tabBarButtonClicked : () -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color(red: 0.85, green: 0.85, blue: 0.85))
            
            HStack(alignment: .top) {
                Spacer()
                tabBarButton(image: "HomeIcon_Sel", selectedImage: "HomeIcon_UnSel", text: "Home", tag: 0)
                Spacer()
                tabBarButton(image: "SearchIcon_Sel", selectedImage: "SearchIcon_UnSel", text: "Search", tag: 1)
                Spacer()
                tabBarButton(image: "WhiteBTQIcon_Sel", selectedImage: "WhiteBTQIcon_UnSel", text: "", tag: 2, isWhiteBTQ: true)
                Spacer()
                tabBarButton(image: "BagIcon_Sel", selectedImage: "BagIcon_UnSel", text: "Bag", tag: 3)
                Spacer()
                tabBarButton(image: "ProfileIcon_Sel", selectedImage: "ProfileIcon_UnSel", text: "Profile", tag: 4)
                Spacer()
            }
            .onTapGesture {
                isTabBarEnable = true
            }
            .padding(.vertical, 20)
            .background(Color.white)
        }
    }
    
    private func tabBarButton(image: String, selectedImage: String, text: String, tag: Int, isWhiteBTQ: Bool = false) -> some View {
        Button(action: {
            selectedTab = tag
            isTabBarEnable = true
            tabBarButtonClicked()
        }) {
            VStack(alignment: .center, spacing: 0) {
                Image(isTabBarEnable && selectedTab == tag ? image : selectedImage)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: isWhiteBTQ ? 35 : 24, height: isWhiteBTQ ? 35 : 24)
                if !text.isEmpty {
                    Text(text)
                        .font(.custom("Baskerville", size: 12))
                        .foregroundColor(selectedTab == tag ? .black : .gray)
                        .padding(.top, 5)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

