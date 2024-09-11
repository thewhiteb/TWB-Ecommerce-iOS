//
//  FeatureProductsBanner.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 10/09/2024.
//

import SwiftUI
import ACarousel

struct FeatureProductsBanner: View {
    
    // Array of image names for feature products
    private var imagesArr: [String] = ["FeatureProduct1","FeatureProduct1","FeatureProduct1","FeatureProduct1"]
    
    var body: some View {
        
        ZStack {
            // Background images
            VStack{
                HStack{
                    Spacer()
                    Image("BGFlower")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 72, height: 72) // Keep background image size static
                        .padding(.trailing,70)
                        .padding(.top,20)
                }
                
                Spacer()
                
                HStack{
                    Image("BGFlower")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 72, height: 72) // Keep background image size static
                        .padding(.leading,20)
                    Spacer()
                }
                
            }
            
            ACarousel(imagesArr, id: \.self,
                      spacing: 5,
                      headspace: 5,
                      sidesScaling:0.8) { name in
                Image(name)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 300)
            }
                      .frame(height: 410)
        }
        .frame(height: 480)
        Spacer()
    }
}

#Preview {
    FeatureProductsBanner()
}
