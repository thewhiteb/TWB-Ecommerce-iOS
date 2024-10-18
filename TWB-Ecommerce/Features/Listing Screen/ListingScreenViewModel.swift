//
//  ListingScreenViewModel.swift
//  TWB-Ecommerce
//
//  Created by Hassam Ali on 18/10/2024.
//

import SwiftUI

class ListingScreenViewModel: ObservableObject {
    @Published var items: [ListingScreenItem]
    let repository: ListingScreenRepository
    var selectedItem: ProductItem?

    init(items: [ListingScreenItem],
         repository: ListingScreenRepository,
         selectedItem: ProductItem?) {
        self.items = items
        self.repository = repository
        self.selectedItem = selectedItem
    }

    func fetchItems(sortingOrder: SortingOrder) {
        Task {
            let results = await repository.getAllListingsItems(item: selectedItem?.name ?? .defaultStr,
                                                               pageSize: 10,
                                                               pageNumber: 1,
                                                               sortOrder: sortingOrder)
            DispatchQueue.main.async {
                self.items = results.data ?? []
            }
        }
    }
}
