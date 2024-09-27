//
//  HomeView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 09/09/2024.
//

import SwiftUI

struct HomeView: View {
    @State private var showTopShadow = false  // State to control the shadow visibilityr
    @State private var selectedItem: String?
    @State private var isShowingDetail = false  // Control navigation
    
    var body: some View {
        NavigationView {
            
            GeometryReader {

                let size = $0.size
                
                ZStack(alignment: .top) {
                    ScrollView(.vertical, showsIndicators :false) {
                        VStack() {
                            BannerSlide(size: size)
                            
                            VStack(spacing: 0) {
                                Text("Trending Products")
                                    .font(Font.custom("Baskerville", size: 22))
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.black)
                                
                                Text("Highlight Of The Week")
                                    .font(Font.custom("Baskerville", size: 14))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(Color(red: 0.46, green: 0.46, blue: 0.46))
                                    .padding(.top, 2)
                            }
                            .padding(.top, 40)
                            
                            TrendingProductList()
                                .padding(.top, 30)
                                .padding(.leading, 10)
                            
                            FeatureProductParallax()
                                .padding(.top, 30)
                            
                            VStack(spacing: 0) {
                                Text("GIFT BY OCCASION")
                                    .font(Font.custom("Baskerville", size: 22))
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.black)
                                
                                Text("For Perfect Moments")
                                    .font(Font.custom("Baskerville", size: 14))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(Color(red: 0.46, green: 0.46, blue: 0.46))
                                    .padding(.top, 2)
                            }
                            .padding(.top, 40)
                            
                            SimpleGiftOccasionList()
                                .padding(.top, 30)
                                .padding(.leading, 10)
                            NowOpeningBanner()
                                .padding(.top, 50)
                            
                            VStack(spacing: 0) {
                                Text("SHOP BY STYLE")
                                    .font(Font.custom("Baskerville", size: 22))
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.black)
                                
                                Text("Explore our latest floral styles")
                                    .font(Font.custom("Baskerville", size: 14))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(Color(red: 0.46, green: 0.46, blue: 0.46))
                                    .padding(.top, 2)
                            }
                            .padding(.top, 40)
                            
                            ShopByStyles { itemName in
                                selectedItem = itemName
                                isShowingDetail = true
                            }
                            .padding(.top, 20)
                            
                            VStack(spacing: 0) {
                                Text("New Arrivals")
                                    .font(Font.custom("Baskerville", size: 22))
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.black)
                                
                                Text("Explore Our Latest Blooms!")
                                    .font(Font.custom("Baskerville", size: 14))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(Color(red: 0.46, green: 0.46, blue: 0.46))
                                    .padding(.top, 2)
                            }
                            .padding(.top, 20)
                            
                            NewArrivals()
                                .padding(.leading, 10)
                                .padding(.trailing, 10)
                                .padding(.top, 30)
                            
                            BorderButton(title: "View New Collection", action: {
                                // Example action
                                print("Bordered Button clicked!")
                            })
                            
//                            VStack(spacing: 0) {
//                                Text("Gift By Color")
//                                    .font(Font.custom("Baskerville", size: 22))
//                                    .fontWeight(.semibold)
//                                    .multilineTextAlignment(.center)
//                                    .foregroundColor(.black)
//
//                                Text("Choose the Perfect Gift by Color")
//                                    .font(Font.custom("Baskerville", size: 14))
//                                    .multilineTextAlignment(.center)
//                                    .foregroundColor(Color(red: 0.46, green: 0.46, blue: 0.46))
//                                    .padding(.top, 2)
//                            }
//                            .padding(.top, 40)
//
//                            GiftByColor()
//                                .padding(.top, 30)
                            
                            VStack(spacing: 0){
                                Text("Shop By Flowers")
                                    .font(Font.custom("Baskerville", size: 22))
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.black)
                                    .padding(.top,40)
                                
                                Text("Pick Your Favorite Flowers")
                                    .font(Font.custom("Baskerville", size: 14))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(Color(red: 0.46, green: 0.46, blue: 0.46))
                                    .padding(.top, 2)
                                
                                ShopByFlowers()
                                    .padding(.top,30)
                                    .padding(.bottom,50)
                            }
                            .frame(maxWidth: .infinity)
                            .background(Color(red: 0.93, green: 0.95, blue: 0.96))
                            
                            VStack(spacing: 0) {
                                Text("On Sale")
                                    .font(Font.custom("Baskerville", size: 22))
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.black)
                                
                                Text("Great Deal Await")
                                    .font(Font.custom("Baskerville", size: 14))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(Color(red: 0.46, green: 0.46, blue: 0.46))
                                    .padding(.top, 2)
                            }
                            .padding(.top, 40)
                            
                            OnSale()
                                .padding(.top,30)
                                .padding(.leading,10)
                                .padding(.trailing,10)
                            
                            BorderButton(title: "View All", action: {
                                // Example action
                                print("Bordered Button clicked!")
                            })
                            .padding(.top,40)
                            .padding(.bottom,40)
                        }
                        .background(
                            GeometryReader { geo -> Color in
                                // Use GeometryReader to detect the scroll offset and toggle shadow
                                DispatchQueue.main.async {
                                    if geo.frame(in: .global).minY < -10 {
                                        if !showTopShadow {
                                            showTopShadow = true
                                        }
                                    } else {
                                        if showTopShadow {
                                            showTopShadow = false
                                        }
                                    }
                                }
                                return Color.clear
                            }
                        )
                    }
                    
                    
                    // Gradient shadow at the top of the view when scrolled down
                    if showTopShadow {
                        LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.3), Color.black.opacity(0)]), startPoint: .top, endPoint: .bottom)
                            .frame(height: 100)
                            .transition(.opacity)
                            .animation(.easeInOut, value: showTopShadow)
                    }
                }
                .background(Color.white) // Set the parent background to white
                .edgesIgnoringSafeArea(.top) // Scroll under the status bar
                .overlay(){
                    if isShowingDetail {
                        if let selectedItem = selectedItem {
                            // Navigate to ListingScreenView when an item is selected
                            GeometryReader { geometry in
                                let safeArea = geometry.safeAreaInsets
                                let size = geometry.size
                                ListingScreenView(title: .constant(selectedItem), safeArea: safeArea, size: size,onBackButtonPressed: {
                                    isShowingDetail.toggle()
                                })
                                .background(Color.white)
                                    .ignoresSafeArea(.container, edges: .top)
                            }
                        }
                    }
                }
//                .navigationDestination(isPresented: $isShowingDetail) {
//                                if let selectedItem = selectedItem {
//                                    // Navigate to ListingScreenView when an item is selected
//                                    GeometryReader { geometry in
//                                        let safeArea = geometry.safeAreaInsets
//                                        let size = geometry.size
//                                        ListingScreenView(title: .constant(selectedItem), safeArea: safeArea, size: size)
//                                            .ignoresSafeArea(.container, edges: .top)
//                                    }
//                                }
//                            }
            }
           
        }
        
    }
}

#Preview {
    HomeView()
}


