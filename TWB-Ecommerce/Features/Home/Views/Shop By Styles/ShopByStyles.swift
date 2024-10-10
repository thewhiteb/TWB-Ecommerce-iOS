//
//  ShopByStyles.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 10/09/2024.
//

import SwiftUI

struct ShopByStyles: View {
    @State var items: [ProductItem]
    
    var onItemSelected: (String) -> Void
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing : 15) {
                ForEach(items) { item in
                    ShopByStyleItem(item: item)
                        .onTapGesture {
                            onItemSelected(item.name ?? .defaultStr) // Trigger the closure with the selected item text
                        }
                }
            }
            .padding()
        }
        
    }
}
#Preview {
    ShopByStyles(items: []) { selectedItem in
            print("Selected Item: \(selectedItem)")
        }
}
