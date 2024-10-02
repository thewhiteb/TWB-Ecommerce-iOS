//
//  BottomView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 20/09/2024.
//

import SwiftUI

struct BottomView: View {
    var onItemSelected: (String) -> Void  // Closure to pass selected item back
    
    var body: some View {
        VStack {
            Text("Showing 156 item(s)")
                .font(Font.custom("Baskerville", size: 12))
                .foregroundColor(Color(red: 0.35, green: 0.35, blue: 0.35))
                .padding(.top, 120)
            
            GridViewItems(onItemClick: { item in
                onItemSelected(item.itemName)  // Pass the selected item name
            })
            .padding(.top, 30)
            .padding(.bottom, 70)
        }
        .zIndex(0)
    }
}


#Preview {
    BottomView(onItemSelected: {text in print(text)})
}
