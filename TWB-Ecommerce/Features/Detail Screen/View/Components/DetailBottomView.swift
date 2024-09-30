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
    
    var onAddToBagClicked: (Bool) -> Void
    
    var itemName : String
    
    var body: some View {
        VStack {
            GeometryReader { geo -> Color in
                let minY = geo.frame(in: .global).minY
                DispatchQueue.main.async {
                    let newOpacity = min(max(((bannerHeight*0.4) - minY) / (bannerHeight * 0.3), 0), 1)
                    headerOpacity = newOpacity
                }
                return Color.clear
            }
            .frame(height: 0)  // Hidden GeometryReader to track scroll position
            
            // Scrollable content
            VStack(alignment :.center,spacing: 0) {
                
                Text(itemName)
                    .font(
                        .getFont(name: .libreBold, size: 16)
                    )
                    .foregroundColor(.black)
                    .padding(.top, 10)
                
                Text("AED 447")
                    .font(
                        .getFont(name: .libreBold, size: 16)
                    )
                    .foregroundColor(.black)
                    .padding(.top, 20)
                
                Text("Including VAT")
                    .font(
                        .getFont(name: .libreBold, size: 10)
                    )
                    .foregroundColor(Constants.gray)
                    .padding(.top, 10)
                
                ZStack {
                    
                    Rectangle()
                        .fill(Color.clear)
                        .frame(height: 56)  // Set fixed height
                        .overlay(
                            Rectangle()
                                .stroke(Color(red: 0.85, green: 0.85, blue: 0.85), lineWidth: 1)
                        )
                    
                    HStack{
                        
                        Image("tabby_ic")
                            .padding(.leading, 10)
                        
                        Image("info")
                        
                        Divider()
                            .frame(width: 1,height: 56)
                        Spacer()
                        
                        Text("Buy now pay later")
                            .font(.getFont(name: .latoBold, size: 12))
                            .foregroundColor(Constants.black)
                        
                        Spacer()
                        Divider()
                            .frame(width: 1,height: 56)
                        Image("tamara_ic")
                        
                        Image("info")
                            .padding(.trailing, 10)
                        
                        
                        
                    }
                }
                .padding()
                .padding(.top, 30)
                
                VStack{
                    // Make the buttons sticky at the bottom
                    HStack(spacing: 10) {
                        AddToBagButton(action: {
                            onAddToBagClicked(true)
                        }, text: "Add to Bag",imageName: "bag")
                    }
                    .padding()
                    .background(Color.white)  // Background for the buttons
                    .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 1)  // Add shadow to the bottom buttons
                }
                .padding(.top, 10)
                
                
            }
        }
    }
}

#Preview {
    DetailBottomView(bannerHeight: 400, headerOpacity: .constant(0.0), onAddToBagClicked: { success in
        print("Add to bag clicked: \(success)")
    }, itemName: "Tube Acrylic 018")
}
