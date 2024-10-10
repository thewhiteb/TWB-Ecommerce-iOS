//
//  ArtWork.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 20/09/2024.
//

import SwiftUI

struct ArtWork: View {
    
    var safeArea: EdgeInsets
    var size: CGSize
    
    var body: some View {
        let height = size.height * 0.35
        GeometryReader { proxy in
            let size = proxy.size
            let minY = proxy.frame(in: .named("SCROLL")).minY
            let progress = minY / (height * (minY > 0 ? 0 : 1))
            
            
            VStack{
                
                Image("Featured_Banner2")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width, height: size.height + (minY > 0 ? minY : 0))
                    .clipped()
                    .overlay(content: {
                        ZStack(alignment: .bottom) {
                            Rectangle()
                                .fill(
                                    .linearGradient(colors: [
                                        .white.opacity(0 - progress)
                                    ], startPoint: .top, endPoint: .bottom)
                                )
                                
                            
                        }
                    })
                    .offset(y: -minY)
                
            }
            
        }
        .frame(height: height + safeArea.top)
    }
}

#Preview {
    GeometryReader {
        let safeArea = $0.safeAreaInsets
        let size = $0.size
        
        ArtWork(safeArea: safeArea, size: size)
    }
    
}
