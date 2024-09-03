//
//  TrendingProductItem.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 03/09/2024.
//

import SwiftUI
import Lottie

struct TrendingProductItem: View {
    let imageName: String
    let itemName: String
    let itemPrice: String
    let isCustomizable: Bool
    
    @State private var isFavorite: Bool = false
    @State private var showAnimation: Bool = false
    
    var body: some View {
        VStack() {
            ZStack {
                Image(imageName)
                    .resizable()
                    .frame(width: 167, height: 195)
                
                HStack {
                    VStack(alignment: .leading) {
                        if isCustomizable {
                            Text("Customizable")
                                .font(.custom("Lato", size: 10))
                                .padding(8)
                                .background(Color.black.opacity(0.7))
                                .foregroundColor(.white)
                                .padding(8)
                        }
                        Spacer()
                    }
                    .padding(.top, 10)
                    .padding(.leading,10)
                    
                    Spacer()
                    
                    VStack {
                        TwitterHeart()
                            .padding(10)
                        Spacer()
                    }
                    .padding(8)
                }
            }.frame(width: 182, height: 210)
            Text(itemName)
                .font(Font.custom("Baskerville", size: 12))
                .foregroundColor(.black)
            
            Text(itemPrice)
                .font(
                    Font.custom("Baskerville", size: 14)
                        .weight(.semibold)
                )
                .foregroundColor(.black)
        }
        
        
            
        
       
    }
}

#Preview {
    TrendingProductItem(imageName: "Image 1", itemName: "Rectangular Acrylic 061", itemPrice: "AED 365", isCustomizable: true)
}
