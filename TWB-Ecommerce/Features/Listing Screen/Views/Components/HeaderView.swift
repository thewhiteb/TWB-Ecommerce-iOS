//
//  HeaderView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 20/09/2024.
//

import SwiftUI

struct HeaderView: View {
    
    var title: String
    var safeArea: EdgeInsets
    var size: CGSize
    
    var onBackButtonPressed: () -> Void
    
    var body: some View {
        GeometryReader { proxy in
            let minY = proxy.frame(in: .named("SCROLL")).minY
            let height = size.height * 0.30
            let progress = minY / (height * (minY > 0 ? 0.5 : 1))
            let titleProgress = minY / height
            
            HStack(spacing: 15) {
                Button {
                    // Back button action
                    onBackButtonPressed()
                } label: {
                    Image("back")
                        .font(.title3)
                        .foregroundColor(.black)
                }
                Spacer(minLength: 0)
                
                Button {
                    // More options button action
                } label: {
                    Image("Search")
                        .font(.title3)
                        .foregroundColor(.black)
                }
            }
            .overlay(content: {
                Text(title)
                    .font(Font.custom("Baskerville", size: 20))
                    .fontWeight(.semibold)
                    .opacity(mapProgressToOpacityTitle(progress: titleProgress)) 
                    
            })
            .padding(.top, safeArea.top + 10)
            .padding([.horizontal, .bottom], 15)
            .background(
                Color.white
                    .opacity(mapProgressToOpacity(progress: progress))
            )
            .offset(y: -minY)
        }
        .frame(height: 35)
    }
    
    func mapProgressToOpacity(progress: CGFloat) -> CGFloat {
        // If the progress crosses -1.10, return 1 (fully visible), otherwise 0 (invisible)
        return progress <= -1.35 ? 1 : 0
    }
    
    func mapProgressToOpacityTitle(progress: CGFloat) -> CGFloat {
        // If the title's progress crosses -1.10, return 1 (fully visible), otherwise 0 (invisible)
        return progress <= -1.10 ? 1 : 0
    }
    
}

#Preview {
    GeometryReader {
        let safeArea = $0.safeAreaInsets
        let size = $0.size
        @State var text = "Acrylic Boxes"
        
        HeaderView(title: text, safeArea: safeArea, size: size,onBackButtonPressed: {
            
        })
    }
}
