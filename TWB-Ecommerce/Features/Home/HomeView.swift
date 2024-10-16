//
//  HomeView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 09/09/2024.
//

import SwiftUI

struct HomeView: View {
    @State private var showTopShadow = false
    var onItemSelected: ([ListingScreenItem]) -> Void
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            
            ZStack(alignment: .top) {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        BannerSlide(banners: HomeScreenDataSingleton.shared.topCrouselBanners ?? [],
                                    size: size)
                        
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
                        
                        TrendingProductList(trendingProductList: HomeScreenDataSingleton.shared.trendingProducts ?? [])
                            .padding(.top, 30)
                            .padding(.leading, 10)
                        
                        FeatureProductParallax(banners: HomeScreenDataSingleton.shared.secondCrouselBanners ?? [])
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
                        
                        SimpleGiftOccasionList(items: HomeScreenDataSingleton.shared.giftByOccasion ?? [])
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
                        let list = HomeScreenDataSingleton.shared.shopByStyle ?? []
                        ShopByStyles(items: list) { itemName in
                            onItemSelected(itemName)
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
                        
                        NewArrivals(items: HomeScreenDataSingleton.shared.items ?? [])
                            .padding(.horizontal, 10)
                            .padding(.top, 30)
                        
                        BorderButton(title: "View New Collection") {
                            print("Bordered Button clicked!")
                        }
                        
                        VStack(spacing: 0) {
                            Text("Shop By Flowers")
                                .font(Font.custom("Baskerville", size: 22))
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.black)
                                .padding(.top, 40)
                            
                            Text("Pick Your Favorite Flowers")
                                .font(Font.custom("Baskerville", size: 14))
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color(red: 0.46, green: 0.46, blue: 0.46))
                                .padding(.top, 2)
                            
                            ShopByFlowers()
                                .padding(.top, 30)
                                .padding(.bottom, 50)
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
                            .padding(.horizontal, 10)
                            .padding(.top, 30)
                        
                        BorderButton(title: "View All") {
                            print("Bordered Button clicked!")
                        }
                        .padding(.top, 40)
                        .padding(.bottom, 40)
                    }
                    .background(
                        GeometryReader { geo -> Color in
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
                
                if showTopShadow {
                    LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.3), Color.black.opacity(0)]), startPoint: .top, endPoint: .bottom)
                        .frame(height: 100)
                        .transition(.opacity)
                        .animation(.easeInOut, value: showTopShadow)
                }
            }
            .background(Color.white)
        }
    }
}

#Preview {
    HomeView(onItemSelected: { _ in })
}
