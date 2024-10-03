//
//  TabContentView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 09/09/2024.
//


import SwiftUI

struct TabContentView: View {
    @State private var selectedTab = 0
    @State private var showBottomNavigation = true  // Manage bottom nav visibility
    @State private var showTabs = true  // Control tab selection
    @State private var isListingViewActive = false
    @State private var isDetailViewActive = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                ZStack {
                    // Main screens with tab navigation
                    if !isListingViewActive && !isDetailViewActive {
                        switch selectedTab {
                        case 0:
                            HomeView(onItemSelected: { item in
                                // Open ListingScreenView when an item is clicked
                                isListingViewActive = true
                                selectedTab = -1
                                showBottomNavigation = true  // Show bottom nav but no tab selected
                                showTabs = false  // No tab selected
                            })
                        case 1:
                            SearchView()
                        case 2:
                            MenuView()
                        case 3:
                            BagView(items: items)
                        case 4:
                            ProfileView()
                        default:
                            HomeView(onItemSelected: { item in
                                isListingViewActive = true
                            })
                        }
                    }
                    
                    // ListingScreenView
                    if isListingViewActive {
                        GeometryReader { geometry in
                            let safeArea = geometry.safeAreaInsets
                            let size = geometry.size
                            ListingScreenView(
                                safeArea: safeArea,
                                size: size,
                                title: "Shop By Style",
                                onItemSelected: { item in  // Move this argument before onBackButtonPressed
                                    isDetailViewActive = true
                                    showBottomNavigation = false  // Hide bottom nav for Detail screen
                                },
                                onBackButtonPressed: {
                                    isListingViewActive = false
                                    showTabs = true  // Restore tab bar selection when going back
                                    selectedTab = 0
                                }
                            )
                            .transition(.move(edge: .trailing))
                        }
                        
                    }
                    
                    // DetailScreenView
                    if isDetailViewActive {
                        DetailScreenView(itemName: "Testing")
                            .transition(.move(edge: .trailing))
                            .onDisappear {
                                // Show the bottom nav again after leaving Detail screen
                                showBottomNavigation = true
                                isDetailViewActive = false
                            }
                    }
                }
                .frame(maxHeight: .infinity)
                .ignoresSafeArea(.all, edges: .top)
                
                // Show bottom navigation bar if `showBottomNavigation` is true
                if showBottomNavigation {
                    VStack(spacing: 0) {
                        // Top border for the tab bar
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
                        .padding(.vertical, 20)
                        .background(Color.white)
                    }
                }
            }
            .ignoresSafeArea()
        }
    }
    
    private func tabBarButton(image: String, selectedImage: String, text: String, tag: Int, isWhiteBTQ: Bool = false) -> some View {
        Button(action: {
            selectedTab = tag
            isListingViewActive = false  // Go back to main tabs
            isDetailViewActive = false  // Go back to main tabs
            showTabs = true
            showBottomNavigation = true
        }) {
            VStack(alignment: .center, spacing: 0) {
                Image(selectedTab == tag ? image : selectedImage)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: isWhiteBTQ ? 35 : 24, height: isWhiteBTQ ? 35 : 24)
                if !text.isEmpty {
                    Text(text)
                        .font(.custom("Baskerville", size: 12))
                        .foregroundColor(selectedTab == tag ? .black : .gray)
                        .padding(.top, 5)
                }
            }
            .frame(maxWidth: .infinity, alignment: .top)
        }
    }
}


#Preview {
    TabContentView()
}
