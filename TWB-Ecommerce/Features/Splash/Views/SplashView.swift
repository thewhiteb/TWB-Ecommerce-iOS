//
//  SplashView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 06/08/2024.
//

import Foundation

import SwiftUI

struct SplashView: View {
    
    @State private var isFlowerVisible = true
    @State private var isSecondImageVisible = false
    @State private var rotationAngle = 0.0
    @State private var navigateToNextScreen = false
    
    var body: some View {
        NavigationStack {
            VStack {
                if isFlowerVisible {
                    Image("flower_loading")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .rotationEffect(.degrees(rotationAngle))
                        .onAppear {
                            withAnimation(.linear(duration: 2.0)) {
                                rotationAngle = 360.0
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                isFlowerVisible = false
                                isSecondImageVisible = true
                            }
                        }
                } else if isSecondImageVisible {
                    Image("splash_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 236, height: 72)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                navigateToNextScreen = true
                            }
                        }
                }
            }
            .padding()
            .background(Color.white)
            .navigationDestination(isPresented: $navigateToNextScreen) {
                TabContentView()
                   .navigationBarBackButtonHidden(true)
                
//                DetailFullImageView(images: ["Bouquet1", "Test", "Bouquet1"], selectedIndex: 0)
            }
        }
        .onAppear() {
            newArivalAPI()
            giftByOccasionAPI()
            shopByStyleAPI()
            trendingProductsAPI()
            topCrouselsAPI()
            secondCrouselsAPI()
        }
        .background(Color.white)
    }
    
    init() {
        for familyNames in UIFont.familyNames {
            print(familyNames)
            
            for fontName in UIFont.fontNames(forFamilyName: familyNames) {
                print("-- \(fontName)")
            }
        }
    }

//    func callBannerAPI() {
//        Task {
//            do {
//                let response = try await AllBannerAPI().call()
//                print(response)
//            } catch let error {
//                print("Error: \(error.localizedDescription)")
//            }
//        }
//    }

    func callPerfumeAPI() {
        Task {
            do {
                let bannerDictionary: [String: Any] = [
                    "heading": "",
                    "imageKey": "Announcement-Mobile-Template copy_2024-09-04 11.34.32 AM.jpg",
                    "imageKeyForDesktop": "Announcement-Template-Black2_2024-09-04 11.26.19 AM.jpg",
                    "description": "",
                    "buttonName": "",
                    "link": "https://www.twb.ae/flowers/abu-dhabi-showroom",
                    "active": true,
                    "bannerTypeEnum": "Announcement",
                    "createdByUserId": "a30629db-e52a-41e5-aaee-a0014d969b30",
                    "modifiedByUserId": "",
                    "portalTypeEnum": "Flower"
                ]
                let endpoint = PerfumeAPI(params: bannerDictionary)
                let response = try await endpoint.call()
                print(response)
            } catch let error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }

//    func updateBannerAPI() {
//        Task {
//            do {
//                var response = try await GetBannerAPI(id: 78).call()
//                response.banner.active.toggle()
//                let secondResponse = try await UpdateBannerAPI(id: 78,
//                                                               params: response.banner.getBannerDictionary()).call()
//                print(secondResponse)
//            } catch let error {
//                print("Error: \(error.localizedDescription)")
//            }
//        }
//    }

    func newArivalAPI() {
        Task {
            let response = await RepositoryImplementation.getNewArrivalsItems()
            if response.data != nil {
                NewArrivalSingleton.shared.items = response.data
            } else {
                // Show Alert
                print(response.statusCode)
                print(response.messages.first)
                print(response)
                NewArrivalSingleton.shared.items = nil
            }
        }
    }

    func giftByOccasionAPI() {
        Task {
            let response = await RepositoryImplementation.getGiftByOccasionItems()
            if response.data != nil {
                NewArrivalSingleton.shared.giftByOccasion = response.data
            } else {
                // Show Alert
                print(response.statusCode)
                print(response.messages.first)
                print(response)
                NewArrivalSingleton.shared.giftByOccasion = nil
            }
        }
    }

    func shopByStyleAPI() {
        Task {
            let response = await RepositoryImplementation.getShopByStyleItems()
            if response.data != nil {
                NewArrivalSingleton.shared.shopByStyle = response.data
            } else {
                // Show Alert
                print(response.statusCode)
                print(response.messages.first)
                print(response)
                NewArrivalSingleton.shared.shopByStyle = nil
            }
        }
    }

    func trendingProductsAPI() {
        Task {
            let response = await RepositoryImplementation.getTrendingProductItems()
            if response.data != nil {
                NewArrivalSingleton.shared.trendingProducts = response.data
            } else {
                // Show Alert
                print(response.statusCode)
                print(response.messages.first)
                print(response)
                NewArrivalSingleton.shared.trendingProducts = nil
            }
        }
    }

    func topCrouselsAPI() {
        Task {
            let response = await RepositoryImplementation.getTopCrouselBanners()
            if response.data != nil {
                NewArrivalSingleton.shared.topCrouselBanners = response.data
            } else {
                // Show Alert
                print(response.statusCode)
                print(response.messages.first)
                print(response)
                NewArrivalSingleton.shared.topCrouselBanners = nil
            }
        }
    }

    func secondCrouselsAPI() {
        Task {
            let response = await RepositoryImplementation.getTopCrouselBanners()
            if response.data != nil {
                NewArrivalSingleton.shared.secondCrouselBanners = response.data
            } else {
                // Show Alert
                print(response.statusCode)
                print(response.messages.first)
                print(response)
                NewArrivalSingleton.shared.secondCrouselBanners = nil
            }
        }
    }
}

#Preview {
    SplashView()
}
