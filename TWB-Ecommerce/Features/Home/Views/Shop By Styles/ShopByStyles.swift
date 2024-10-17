//
//  ShopByStyles.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 10/09/2024.
//

import SwiftUI

struct ShopByStyles: View {
    @State var items: [ProductItem]
    @State var isLoading: Bool = false

    let respositorty: ListingScreenRepository = ListingScreenRepositoryImplementation()
    
    var onItemSelected: ([ListingScreenItem]) -> Void
    
    var body: some View {
        ZStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing : 15) {
                    ForEach(items) { item in
                        ShopByStyleItem(item: item)
                            .onTapGesture {
                                isLoading = true
                                openListingScreen(for: item)
                            }
                    }
                }
                .padding()
            }
            if isLoading {
                ProgressView("Loading...")
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding()
            }
        }
    }

    private func openListingScreen(for item: ProductItem) {
        Task {
            let results = await respositorty.getAllListingsItems(for: item.name ?? .defaultStr,
                                                                 pageSize: 10,
                                                                 pageNumber: 1,
                                                                 sortOrder: .trending)
            isLoading = false
            onItemSelected(results.data ?? []) // Trigger the closure with the selected item text
        }
    }
}
#Preview {
    ShopByStyles(items: []) { selectedItem in
            print("Selected Item: \(selectedItem)")
        }
}
