//
//  TabContentView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 09/09/2024.
//


import SwiftUI

struct TabContentView: View {
    @Namespace var animation
    
    @State private var selectedTab = 0
    @State private var listItemSelected : TrendingProduct? = nil
    @State private var isTabBarEnable = true
    @State private var showBottomNavigation = true
    @State private var isListingViewActive = false
    @State private var isDetailViewActive = false
    @State private var isDetailFullImageViewActive = false
    @State private var dragOffset: CGFloat = 0.0
    @GestureState private var gestureDragOffset: CGFloat = 0.0
    
    @State private var images: [String] = []
    @State private var selectedImageIndex = 0
    
    var body: some View {
        NavigationView {
            VStack (spacing : 0){
                ZStack {
                    
                    switch selectedTab {
                    case 0:
                        
                        HomeView(onItemSelected: { _ in
                            withAnimation {
                                isListingViewActive = true
                                isTabBarEnable = false
                                showBottomNavigation = true
                            }
                        })
                        
                        .offset(x: parallaxOffsetForFirstView())
                        .zIndex(0)
                        .animation(.easeInOut(duration: 0.2), value: isListingViewActive)
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
                            withAnimation {
                                isListingViewActive = true
                                isTabBarEnable = true
                                showBottomNavigation = true
                            }
                        })
                        
                        .offset(x: parallaxOffsetForFirstView())
                        .zIndex(0)
                        .animation(.easeInOut(duration: 0.3), value: isListingViewActive)
                    }
                    
                    
                    
                    
                    if isListingViewActive {
                        ListingScreenView(
                            animation : animation,
                            title: "Shop By Style",
                            onItemSelected: { item in
                                withAnimation(.spring()) {
                                    isDetailViewActive = true
                                    listItemSelected = item
                                }
                            },
                            onBackButtonPressed: {
                                withAnimation {
                                    isListingViewActive = false
                                    isTabBarEnable = true
                                    
                                }
                            }
                        )
                        .offset(x: dragOffset > 0 ? dragOffset : 0 )
                        .zIndex(1)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
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
                                            dragOffset = 0
                                        }
                                    }
                                }
                        )
                        .transition(.move(edge: .trailing))
                        .animation(.easeInOut(duration: 0.3), value: isListingViewActive)
                    }
                    
                    if isDetailViewActive, let selectedItem = listItemSelected {
                        DetailScreenView(animation: animation, item: selectedItem,  // Pass the selected item to DetailScreenView
                                         onBackButtonPressed: {
                            withAnimation(.spring()) {
                                isTabBarEnable = isListingViewActive ? false : true
                                isDetailViewActive = false
                            }
                        }, onImageTapped: { selectedIndex, image in
                            images = image
                            selectedImageIndex = selectedIndex
                            isDetailFullImageViewActive = true
                        })
                        .zIndex(2)
                    }
                    
                    // DetailFullImageView (no parallax needed here)
                    if isDetailFullImageViewActive {
                        DetailFullImageView(images: images, selectedIndex: selectedImageIndex, onClickDismiss: {
                            withAnimation {
                                isDetailFullImageViewActive = false
                            }
                        })
                        .transition(.move(edge: .trailing))  // Slide-in from right to left
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
            withAnimation {
                selectedTab = tag
                isListingViewActive = false
                isDetailViewActive = false
                showBottomNavigation = true
            }
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
    
    // Parallax offset for the first view based on whether second view is visible
    private func parallaxOffsetForFirstView() -> CGFloat {
        if isListingViewActive {
            // Move the first view 20% to the left while second view is entering
            return -UIScreen.main.bounds.width * 0.4 + dragOffset * 0.4
        } else {
            // Move the first view back to its original position
            return dragOffset * 0.4
        }
    }
}

//#Preview {
//    TabContentView()
//}
