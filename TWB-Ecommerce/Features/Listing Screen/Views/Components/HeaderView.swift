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
            let topSafeAreaHeight = proxy.safeAreaInsets.top
            
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
            .frame(maxWidth: .infinity)  // Ensure the HStack takes full width
            .frame(height: 70)  // Set the fixed content height for the header
            .overlay(content: {
                                Text(title)
                                    .font(Font.custom("Baskerville", size: 22))
                                    .fontWeight(.semibold)
                                    .opacity(mapProgressToOpacityTitle(progress: titleProgress))
                
            })
            .padding(.top, 50 + topSafeAreaHeight)
            .padding(.horizontal)
            .background(
                Color.white
                    .opacity(mapProgressToOpacity(progress: progress))
            )
            .offset(y: -minY)
        }
        .frame(height: 50)
    }
    
    func mapProgressToOpacity(progress: CGFloat) -> CGFloat {
        let aMin: CGFloat = -1.25
        let aMax: CGFloat = -1.00
           
           // Clamp the value of 'a' within the range [aMin, aMax]
        let clampedA = max(min(progress, aMax), aMin)
           
           // Reverse the mapping: Map [aMax, aMin] to [0, 1]
           return (aMax - clampedA) / (aMax - aMin)
    }
    
    func mapProgressToOpacityTitle(progress: CGFloat) -> CGFloat {
        let aMin: CGFloat = -1.25
           let aMax: CGFloat = -1.00
           
           // Clamp the value of 'a' within the range [aMin, aMax]
        let clampedA = max(min(progress, aMax), aMin)
           
           // Reverse the mapping: Map [aMax, aMin] to [0, 1]
           return (aMax - clampedA) / (aMax - aMin)
    }
    
}

//#Preview {
//    GeometryReader {
//        let safeArea = $0.safeAreaInsets
//        let size = $0.size
//        @State var text = "Acrylic Boxes"
//
//        HeaderView(title: text, safeArea: safeArea, size: size,onBackButtonPressed: {
//
//        })
//    }
//}
