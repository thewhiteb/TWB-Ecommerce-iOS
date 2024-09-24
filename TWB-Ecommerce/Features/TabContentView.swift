//
//  TabContentView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 09/09/2024.
//

import SwiftUI

struct TabContentView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        
        VStack(spacing: 0) {
            // Content area that fills the available space
            ZStack {
                switch selectedTab {
                case 0:
                    HomeView()
                case 1:
                    SearchView()
                case 2:
                    WhiteBTQView()
                case 3:
                    BagView()
                case 4:
                    ProfileView()
                default:
                    HomeView()
                }
            }
            .frame(maxHeight: .infinity) // This ensures the content takes up the available space
            .ignoresSafeArea(.all, edges: .top) // Extends the view behind the status bar
            
            // Custom Tab Bar with Top Border
            VStack(spacing: 0) {
                // Top border for the tab bar
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color(red: 0.85, green: 0.85, blue: 0.85)) // Customize the border color here
                
                // Tab buttons
                HStack(alignment: .top) {  // Align items to the top
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
                .padding(.vertical, 20)
                .background(Color.white)
            }
        }
        .ignoresSafeArea(.all, edges: .bottom) // Ensures the content extends behind the tab bar area
        .navigationBarBackButtonHidden(true) // Hide back button
    }
    
    private func tabBarButton(image: String, selectedImage: String, text: String, tag: Int, isWhiteBTQ: Bool = false) -> some View {
        Button(action: {
            selectedTab = tag
        }) {
            VStack(alignment: .center, spacing: 0) {
                // Display selected or unselected image based on the current selected tab
                Image(selectedTab == tag ? image : selectedImage)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: isWhiteBTQ ? 35 : 24, height: isWhiteBTQ ? 35 : 24) // Larger size for WhiteBTQ
                
                if !text.isEmpty {
                    Text(text)
                        .font(.custom("Baskerville", size: 12)) // Custom font applied here
                        .foregroundColor(selectedTab == tag ? .black : .gray)
                        .padding(.top, 5)
                }
            }
            .frame(maxWidth: .infinity, alignment: .top) // Make sure the content takes up the full width and aligns to the top
        }
    }
}

#Preview {
    TabContentView()
}
