//
//  NeedHelpSmallView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 04/10/2024.
//

import SwiftUI

struct NeedHelpSmallView: View {
  
    @State private var showHelpView = false
    var body: some View {
        VStack{
            ZStack {
                Rectangle()
                    .fill(Constants.lightGray)
                
                HStack{
                    Image("help_ic")
                    Text("Need Help?")
                        .font(.getFont(name: .libreBold, size: 12))
                    
                    Text("Call or Whatsapp us")
                        .font(.getFont(name: .libreRegular, size: 12))
                    
                    Spacer()
                    
                    Image("DownArrow")
                        .padding(.trailing, 5)
                    
                    
                }
                .padding(.horizontal)
                
            }
            .onTapGesture {
                showHelpView.toggle()
            }
            .frame(width: .infinity, height:65)
        }
        .sheet(isPresented : $showHelpView){
            NeedHelpLargeView()
                .presentationDetents([.fraction(0.3), .medium])
        }
    }
}

#Preview {
    NeedHelpSmallView()
}
