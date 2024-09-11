//
//  NowOpeningBanner.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 10/09/2024.
//

import SwiftUI

struct NowOpeningBanner: View {
    var body: some View {
        
        ZStack(alignment : .top){
            Image("Abudhabi")
            
            VStack{
                ZStack{
                    HStack{
                        Image("campaign")
                        Text("Explore Our New Showroom")
                            .font(.custom("Lato", fixedSize: 14))
                            .foregroundColor(.white)
                        Image("star")
                    }
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: 40)
                .background(Color.black)
                
                
                
                Spacer()
                ZStack{
                    Text("Al Bateen - Abu Dhabi")
                        .font(.custom("Baskerville", fixedSize: 20))
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .padding(10)
                    
                }
                .background(.white)
                
                ZStack{
                    Text("Now Open")
                        .font(.custom("Baskerville", fixedSize: 15))
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .padding(10)
                    
                }
                .background(.white)
                .padding(.bottom,10)
                
            }
            
        }
        .frame(height: 300)
        
        
        
    }
}

#Preview {
    NowOpeningBanner()
}

