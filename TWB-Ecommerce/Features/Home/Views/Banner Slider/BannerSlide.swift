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
    
    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                ForEach(0..<images.count, id: \.self) { index in
                    Image(images[index])
                        .resizable()
                        .aspectRatio(contentMode: .fill)  // Maintains aspect ratio, fills the available width
                        .frame(height: 500)  // Set height to 300
                        .clipped()  // Ensures the image doesn't overflow the frame
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .frame(height: 500) // Frame for the TabView
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
    BannerSlide()
}

