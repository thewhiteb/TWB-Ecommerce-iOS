//
//  FeatureProductParallax.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 16/09/2024.
//

import SwiftUI

struct FeatureProductParallax: View {
    
    private var imagesArr: [String] = ["Featured_Banner1", "Featured_Banner2"]
    
    var body: some View {
        ScrollView(.horizontal) {
                   LazyHStack(spacing: 1) {
                       ForEach(imagesArr, id: \.self) { imageName in
                           VStack {
                               ZStack {
                                   Image(imageName)
                                       .resizable()
                                       .scaledToFill()
                                       .scrollTransition(axis: .horizontal) { content, phase in
                                           content
                                               .offset(x: phase.isIdentity ? 0 : phase.value * -200)
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
    FeatureProductParallax()
}
