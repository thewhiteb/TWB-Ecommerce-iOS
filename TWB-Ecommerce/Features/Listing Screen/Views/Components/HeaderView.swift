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
    
    
    var body: some View {
        GeometryReader { proxy in
            let minY = proxy.frame(in: .named("SCROLL")).minY
            let height = size.height * 0.45
            let progress = minY / (height * (minY > 0 ? 0.5 : 1))
            let titleProgress = minY / height
            
            HStack(spacing: 15) {
                Button {
                    // Back button action
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
                    .opacity(-titleProgress > 1 ? 1 : 0) // Adjust opacity to control when the text fades in
                    .offset(y: -titleProgress > 1 ? 0 : 45)
                    .animation(.easeOut(duration: 0.25), value: -titleProgress > 0.85)
            })
            .padding(.top, safeArea.top + 10)
            .padding([.horizontal, .bottom], 15)
            .background(
                Color.white
                    .opacity(-progress > 1 ? 1 : 0)
            )
            .offset(y: -minY)
        }
        .frame(height: 35)
    }
}

#Preview {
    GeometryReader {
        let safeArea = $0.safeAreaInsets
        let size = $0.size
        @State var text = "Acrylic Boxes"
        
        HeaderView(title: text, safeArea: safeArea, size: size)
    }
}
