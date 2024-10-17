//
//  BannerSlide.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 03/09/2024.
//

import SwiftUI
import SDWebImageSwiftUI
import SDWebImage

struct BannerSlide: View {
    
    @State private var currentPage = 0
    let banners: [Banner]
    var size: CGSize
    
    var body: some View {
        let height = size.height * 0.55
        
        VStack {
            TabView(selection: $currentPage) {
                ForEach(0..<banners.count) { index in
                    let url = Constants.imagesBaseURL + (banners[index].imageKey ?? .defaultStr)
                    WebImage(url: URL(string: url)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .clipped()
                    } placeholder: {
                        ImagePlaceholderView()
                    }
                    .indicator(.activity) // Activity Indicator
                    .transition(.fade(duration: 0.5)) // Fade Transition with duration
                    .frame(height: height)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .frame(height: height) // Frame for the TabView
            .onAppear {
                setupPageControlAppearance()
            }
            Spacer()
                .onReceive(timer) { _ in
                    withAnimation {
                        if banners.count > 1 {
                            currentPage = (currentPage + 1) % banners.count
                        }
                    }
                }
    
        }
    }
    
    let timer = Timer.publish(every: 10, on: .main, in: .common).autoconnect()
    
    // Function to set up custom colors for the page control dots
    func setupPageControlAppearance() {
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor.black  // Active dot color
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.lightGray   // Inactive dots color
    }
}

#Preview {
    GeometryReader {
       let size = $0.size
        BannerSlide(banners: globalBanners, size: size)
    }
  
}
