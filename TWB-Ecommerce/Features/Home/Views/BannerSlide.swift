//
//  BannerSlide.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 03/09/2024.
//

import SwiftUI

struct BannerSlide: View {
    
    @State private var currentPage = 0
    let images = ["Image 1", "Image 2", "Image 3"]
    
    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                ForEach(0..<images.count, id: \.self) { index in
                    Image(images[index])
                        .resizable()
                        .scaledToFill()
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .frame(height: 250)
            Spacer()
                .onReceive(timer) { _ in
                    withAnimation {
                        currentPage = (currentPage + 1) % images.count
                    }
                }
        }
    }
    
    let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
}

#Preview {
    BannerSlide()
}
