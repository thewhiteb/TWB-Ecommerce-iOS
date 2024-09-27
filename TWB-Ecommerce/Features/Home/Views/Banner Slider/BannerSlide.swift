//
//  BannerSlide.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 03/09/2024.
//

import SwiftUI

struct BannerSlide: View {
    
    @State private var currentPage = 0
    let images = ["MainBanner1", "MainBanner2","MainBanner3"]
    
    var size: CGSize
    
    
    var body: some View {
        let height = size.height * 0.55
        
        VStack {
            TabView(selection: $currentPage) {
                ForEach(0..<images.count, id: \.self) { index in
                    Image(images[index])
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: height)
                        .clipped()
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
                        currentPage = (currentPage + 1) % images.count
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
       BannerSlide(size: size)
    }
  
}

