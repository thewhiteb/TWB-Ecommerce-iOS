//
//  BagView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 09/09/2024.
//


import SwiftUI

struct BagView: View {
    @State var count: Int
    var body: some View {
        VStack {
            getTitleView(count: count)
            Spacer()
            if count == 0 {
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
    BagView(count: 1)
}
