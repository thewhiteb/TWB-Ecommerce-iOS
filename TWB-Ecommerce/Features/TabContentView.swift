//
//  TabContentView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 09/09/2024.
//


import SwiftUI

struct TabContentView: View {
    @State private var selectedTab = 0
    @State private var showBottomNavigation = true
    @State private var isListingViewActive = false
    @State private var isDetailViewActive = false
    @State private var isDetailFullImageViewActive = false
    
    @State private var images: [String] = []
    @State private var selectedImageIndex = 0
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                ZStack {
                    // Main screens with tab navigation
                    if !isListingViewActive && !isDetailViewActive {
                        switch selectedTab {
                        case 0:
                            HomeView(onItemSelected: { _ in
                                isListingViewActive = true
                                selectedTab = -1
                                showBottomNavigation = true
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
                            HomeView(onItemSelected: { _ in
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
                                onItemSelected: { _ in
                                    isDetailViewActive = true
                                    showBottomNavigation = false
                                },
                                onBackButtonPressed: {
                                    isListingViewActive = false
                                    selectedTab = 0
                                }
                            )
                            .transition(.move(edge: .trailing))
                        }
                    }
                    
                    // DetailScreenView
                    if isDetailViewActive {
                        DetailScreenView(itemName: "Tube Acrylic 018", onBackButtonPressed: {
                            showBottomNavigation = true
                            isDetailViewActive = false
                            selectedTab = isListingViewActive ? -1 : 0
                        }, onImageTapped: { selectedIndex, image in
                            images = image
                            selectedImageIndex = selectedIndex
                            isDetailFullImageViewActive = true
                        })
                        .transition(.move(edge: .trailing))
                    }
                    
                    // DetailFullImageView
                    if isDetailFullImageViewActive {
                        DetailFullImageView(images: images, selectedIndex: selectedImageIndex, onClickDismiss: {
                            isDetailFullImageViewActive = false
                        })
                    }
                }
                .frame(maxHeight: .infinity)
                .ignoresSafeArea(.all, edges: .top)
                
                // Bottom Navigation
                if showBottomNavigation {
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
            isListingViewActive = false
            isDetailViewActive = false
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
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    TabContentView()
}
