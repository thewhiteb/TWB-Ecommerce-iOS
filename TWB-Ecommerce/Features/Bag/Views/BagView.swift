//
//  BagView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 09/09/2024.
//


import SwiftUI

struct BagView: View {
    @State var items: [BagViewItemModel]
    var body: some View {
        VStack {
            getTitleView(count: items.count)
            Spacer()
            if items.count == 0 {
                EmptyBagView()
                Spacer()
            } else {
                VStack {
                    BagListingView(items: items)
                        .padding(.top, 10)
                }
                .background(Constants.lightGray)
            }
        }
        .safeAreaInset(edge: .top) {
            Color.clear.frame(height: 50)
        }
    }

    @ViewBuilder
    func getTitleView(count: Int) -> some View {
        HStack {
            Text("My Bag (\(count))")
        }
    }

}

#Preview {
    BagView(items: items)
}
