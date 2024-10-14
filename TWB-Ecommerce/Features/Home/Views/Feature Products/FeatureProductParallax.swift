//
//  FeatureProductParallax.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 16/09/2024.
//

import SwiftUI
import SDWebImageSwiftUI
import SDWebImage

struct FeatureProductParallax: View {
    
    var banners: [Banner]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 1) {
                ForEach(banners) { banner in
                    VStack {
                        ZStack {
                            let url = Constants.imagesBaseURL + (banner.imageKey ?? .defaultStr)
                            WebImage(url: URL(string: url)) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .scrollTransition(axis: .horizontal) { content, phase in
                                        content
                                            .offset(x: phase.isIdentity ? 0 : phase.value * -200)
                                    }
                            } placeholder: {
                                ImagePlaceholderView()
                            }
                        }
                        .containerRelativeFrame(.horizontal)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .shadow(color: .black.opacity(0.25), radius: 5, x: 5, y:5)
                        .scrollTransition(axis: .horizontal) { content, phase in
                            content.scaleEffect(phase.isIdentity ? 1 : 0.95)
                        }
                        
                        
                    }
                }
            }
        }
        .contentMargins(16)
        .scrollTargetBehavior(.paging)
        .scrollIndicators(.hidden)
        .frame(height: 600)
    }
}


#Preview {
    FeatureProductParallax(banners: [])
}

