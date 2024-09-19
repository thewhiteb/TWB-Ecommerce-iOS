//
//  BagListingView.swift
//  TWB-Ecommerce
//
//  Created by Hassam Ali on 19/09/2024.
//

import SwiftUI

struct BagListingView: View {
    let items: [BagViewItemModel]
    var body: some View {
        ScrollView {
            ForEach(items) { item in
                LazyVStack(alignment: .leading, spacing: 10, content: {
                    BagItemView(ietm: item)
                })
            }
        }
    }
}

#Preview {
    BagListingView(items: items)
}
