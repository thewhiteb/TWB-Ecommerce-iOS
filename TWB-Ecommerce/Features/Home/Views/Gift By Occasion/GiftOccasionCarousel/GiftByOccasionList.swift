//
//  GiftByOccasionList.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 10/09/2024.
//

import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct GiftByOccasionList: View {
    
    // Sample list of 10 items
    @State var items: [Category]
    
    var body: some View {
        VStack {
            GeometryReader{
                let size  = $0.size
                
                ScrollView(.horizontal){
                    HStack(spacing :5){
                        ForEach(items) { item in
                            CardView(item)
                        }
                    }
                    .padding(.trailing, size.width - 180)
                    .scrollTargetLayout()
                }
                .scrollTargetBehavior(.viewAligned)
                .scrollIndicators(.hidden)
//                .clipShape(.rect(cornerRadius: 25))
                
                
            }
            .padding(.horizontal,15)
            .padding(.top,30)
            .frame(height: 250)
        }
    }
    
    
    @ViewBuilder
    func CardView(_ item : Category) -> some View{
        GeometryReader {proxy in
            let size = proxy.size
            let minX = proxy.frame(in: .scrollView).minX
            
            let reducingWidth = (minX / 190) * 130
            let cappedWidth = min(reducingWidth,130)
            
            let frameWidth = size.width - (minX > 0 ? cappedWidth : -cappedWidth)
            let url = Constants.imagesBaseURL + (item.storyImageKey ?? "")
            WebImage(url: URL(string: url)) { image in
                image.resizable().aspectRatio(contentMode: .fill)
            } placeholder: {
                Rectangle().foregroundColor(.gray)
            }
            .indicator(.activity) // Activity Indicator
            .transition(.fade(duration: 0.5)) // Fade Transition with duration
            .frame(width: size.width,height: size.height)
            clipShape(.rect(cornerRadius: 0))
            .offset(x: minX > 0 ? 0 : -cappedWidth)
            .offset(x: -item.previousOffset)
        }
        .frame(width: 180,height: 250)
        .offsetX { offset in
            let reducingWidth = (offset / 190) * 130
            let index = items.indexOf(item)
            
            if items.indices.contains(index + 1){
                items[index + 1].previousOffset = (offset < 0 ? 0 : reducingWidth)
            }
                
        }
    }
}

#Preview {
    GiftByOccasionList(items: [])
}
