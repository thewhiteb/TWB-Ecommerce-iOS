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
    @State private var listItemSelected : TrendingProduct2? = nil
    @State private var listItemSelected2 : ListingScreenItem? = nil
    @State private var isTabBarEnable = true
    @State private var isDragDisable = false
    @State private var showBottomNavigation = true
    @State private var loginPhoneNumber : String = ""
    @State private var isComingFromCheckout : Bool = true
    
    @State private var isListingViewActive = false
    @State private var isDetailViewActive = false
    @State private var isDetailFullImageViewActive = false
    @State private var isLoginViewActive = false
    @State private var isOTPViewActive = false
    
    
    
    @State private var dragOffset: CGFloat = 0.0
    @State private var dragDetailOffset: CGFloat = 0.0
    @GestureState private var gestureDragOffset: CGFloat = 0.0
    
    @State private var images: [String] = []
    @State private var selectedImageIndex = 0

    @State var listingScreenItems: [ListingScreenItem] = []
    
    var body: some View {
        NavigationView {
            VStack (spacing : 0) {
                ZStack {
                    switch selectedTab {
                    case 0:
                        HomeView(onItemSelected: { items in
                            self.listingScreenItems = items
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
                                isTabBarEnable = false
                                showBottomNavigation = true
                            }
                        })
                        .offset(x: parallaxOffsetForFirstView())
                        .zIndex(0)
                        .animation(.easeInOut(duration: 0.3), value: isListingViewActive)
                    }
                    
                    
                    if isListingViewActive {
                        ListingScreenTabComponent(
                            animation: animation,
                            isDragDisable: $isDragDisable,
                            isListingViewActive: $isListingViewActive,
                            isTabBarEnable: $isTabBarEnable,
                            onItemSelected: { item in
                                withAnimation {
                                    isDetailViewActive = true
                                    listItemSelected2 = item
                                    isTabBarEnable = false
                                }
                            },
                            dragOffset: $dragOffset,
                            items: self.listingScreenItems
                        )
                        .transition(.move(edge: .trailing))
                        .animation(.easeInOut(duration: 0.3), value: isListingViewActive)
                        .zIndex(1)
                    }
                    
                    
                    if isDetailViewActive, let selectedItem = listItemSelected {
                        DetailScreenTabComponent(
                            animation: animation,
                            isDragDisable: $isDragDisable,
                            isDetailViewActive: $isDetailViewActive,
                            isListViewActive: $isListingViewActive,
                            isTabBarEnable: $isTabBarEnable,
                            selectedItem: selectedItem,
                            onImageTapped: { selectedIndex, image in
                                images = image
                                selectedImageIndex = selectedIndex
                                isDetailFullImageViewActive = true
                                showBottomNavigation = false
                            },
                            dragDetailOffset: $dragDetailOffset
                        )
                        .transition(.move(edge: .trailing))
                        .animation(.easeInOut(duration: 0.3), value: isDetailViewActive)
                        .zIndex(2)
                    }
                    
                    
                    if isDetailFullImageViewActive {
                        DetailFullImageTabComponent(
                            images: images,
                            selectedImageIndex: selectedImageIndex,
                            isDetailFullImageViewActive: $isDetailFullImageViewActive,
                            showBottomNavigation: $showBottomNavigation
                        )
                        .transition(.move(edge: .trailing))
                        .animation(.easeInOut(duration: 0.3), value: isDetailViewActive)
                        .zIndex(3)
                    }
                    
                    
//                    if isLoginViewActive{
//                        LoginViewTabComponent(onCrossClick: {
//                            withAnimation {
//                                showBottomNavigation = true
//                                isLoginViewActive = false
//                            }
//                        },onVerifyNumber: { value in
//                            loginPhoneNumber = value
//                            isOTPViewActive = true
//                        })
//                        .transition(.move(edge: .trailing))
//                        .animation(.easeInOut(duration: 0.3), value: isLoginViewActive)
//                    }
//                    
//                    
//                    if isOTPViewActive{
//                        OTPViewTabComponent(phoneNumber: $loginPhoneNumber,isComingFromCheckout: isComingFromCheckout, onBackClick: {
//                            withAnimation {
//                                isOTPViewActive = false
//                            }  
//                        })
//                            .transition(.move(edge: .trailing))
//                            .animation(.easeInOut(duration: 0.3), value: isOTPViewActive)
//                        
//                    }
                    
                    
                }
                .frame(maxHeight: .infinity)
                .ignoresSafeArea(.all, edges: .top)
                
                if showBottomNavigation {
                    BottomNavigationBar(
                        selectedTab: $selectedTab,
                        isTabBarEnable: $isTabBarEnable,
                        tabBarButtonClicked: {
                            isListingViewActive = false
                            isDetailViewActive = false
                            isDetailFullImageViewActive = false
                            showBottomNavigation = true
                        }
                    )
                }
            }
            .ignoresSafeArea()
            
        }
    }
    
    // Parallax offset for the first view based on whether second view is visible
    private func parallaxOffsetForFirstView() -> CGFloat {
        if isListingViewActive {
            return -UIScreen.main.bounds.width * 0.4 + dragOffset * 0.4
        } else {
            return dragOffset * 0.4
        }
    }
}
