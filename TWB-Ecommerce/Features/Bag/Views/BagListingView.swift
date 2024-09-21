//
//  BagListingView.swift
//  TWB-Ecommerce
//
//  Created by Hassam Ali on 19/09/2024.
//

import SwiftUI

struct BagListingView: View {
    @State var totalAmount: Int = 0
    @State var items: [BagViewItemModel] {
        didSet {
            var total: Int = 0
            for item in items {
                total += (item.count * item.totalPrice)
            }
            totalAmount = total
        }
    }

    var body: some View {
        VStack {
            ScrollView {
                ForEach(items) { item in
                    LazyVStack(alignment: .leading, spacing: 10, content: {
                        BagItemView(item: item)
                    })
                }
                getTrendingItemsView()
                    .padding([.leading, .trailing], 16)
                    .background(Constants.white)
            }
            grandTotalView()
                .padding(16)
        }
    }
    
    @ViewBuilder
    func grandTotalView() -> some View {
        VStack {
            HStack {
                HStack(spacing: 5) {
                    Text("Grand Total")
                        .font(.getFont(name: .libreBold, size: 12))
                        .foregroundStyle(Constants.black)
                    Text("(Incl VAT)")
                        .font(.getFont(name: .libreRegular, size: 12))
                        .foregroundStyle(Constants.gray)
                }
                Spacer()
                Text("AED \(totalAmount)")
                    .font(.getFont(name: .libreBold, size: 12))
                    .foregroundStyle(Constants.black)
            }
            
            Divider()
                .padding([.top, .bottom], 16)
            HStack(spacing: 10) {
                Button {
                    print("Continue shopping")
                } label: {
                    Text("Continue shopping")
                }
                .frame(maxWidth: .infinity, maxHeight: 50)
                .border(Constants.black)
                .foregroundStyle(Constants.black)
                
                Button {
                    print("Proceed to checkout")
                } label: {
                    Text("Proceed to checkout")
                }
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background(Constants.black)
                .foregroundStyle(Constants.white)
            }
        }
    }

    @ViewBuilder
    func getTrendingItemsView() -> some View {
        VStack(alignment: .leading) {
            Text("You May Also Like")
                .font(.getFont(name: .libreBold, size: 18))
                .foregroundStyle(Constants.black)
                .padding([.top, .bottom], 30)
            TrendingProductList()
        }
    }
}

#Preview {
    BagListingView(items: items)
}
