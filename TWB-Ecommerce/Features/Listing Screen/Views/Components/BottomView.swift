//
//  BottomView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 20/09/2024.
//

import SwiftUI

struct BottomView: View {
    var onItemSelected: (ListingScreenItem) -> Void  // Closure to pass selected item back
    var items: [ListingScreenItem]
    
    var animation : Namespace.ID
    
    var body: some View {
        VStack {
            Text("Showing 156 item(s)")
                .font(Font.custom("Baskerville", size: 12))
                .foregroundColor(Color(red: 0.35, green: 0.35, blue: 0.35))
                .padding(.top, 120)
            
            GridViewItems(animation : animation, items: items , onItemClick: { item in
                onItemSelected(item)  // Pass the selected item name
            })
            .padding(.top, 30)
            .padding(.bottom, 70)
        }
        .zIndex(0)
    }
}


#Preview {
    @Previewable @Namespace var animation
    BottomView(onItemSelected: {text in print(text)}, items: [], animation: animation)
}
