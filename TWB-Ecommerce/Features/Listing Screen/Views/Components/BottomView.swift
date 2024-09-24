//
//  BottomView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 20/09/2024.
//

import SwiftUI

struct BottomView: View {
    var body: some View {
        VStack{
            Text("Showing 156 item(s)")
                .font(Font.custom("Baskerville", size: 10))
                .foregroundColor(Color(red: 0.35, green: 0.35, blue: 0.35))
                .padding(.top,120)
            
            GridViewItems()
                .padding(.top,30)
        }
        .zIndex(0)
    }
}

#Preview {
    BottomView()
}
