//
//  DetailBottomView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 26/09/2024.
//

import SwiftUI

struct DetailBottomView: View {
    let bannerHeight: CGFloat
    @Binding var headerOpacity: Double
    
    var body: some View {
        VStack {
            GeometryReader { geo -> Color in
                let minY = geo.frame(in: .global).minY
                DispatchQueue.main.async {
                    let newOpacity = min(max(((bannerHeight*0.4) - minY) / (bannerHeight * 0.4), 0), 1)
                    headerOpacity = newOpacity
                }
                return Color.clear
            }
            .frame(height: 0)  // Hidden GeometryReader to track scroll position
            
            // Scrollable content
            VStack {
                Text("Detail Content Below the Banner")
                    .font(.title)
                    .padding()
                
                ForEach(0..<20) { index in
                    Text("Content \(index + 1)")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
            }
        }
    }
}

#Preview {
    DetailBottomView(bannerHeight: 400, headerOpacity: .constant(0.0))
}
