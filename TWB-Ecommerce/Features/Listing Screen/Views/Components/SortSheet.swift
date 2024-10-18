//
//  SortSheet.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 24/09/2024.
//

import SwiftUI

struct SortSheet: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var sortingOrder: SortingOrder

    var options: [SortingOrder: String] = [
        .newest: "Newest",
        .highestPrice: "Highest Price",
        .lowestPrice: "Lowest Price",
        .topSeller: "Top Seller",
        .trending: "Trending"
    ]

    var sortingOptions: [SortingOrder] = [.topSeller, .trending, .newest, .lowestPrice, .highestPrice]

    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("Sort By")
                        .font(.getFont(name: .baskerville, size: 18))
                        .fontWeight(.semibold)
                        .padding(.leading, 14)
                    Spacer()
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image("Close Button")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24) // Adjust size as needed
                            .padding(.trailing, 14)
                    }
                }
                .padding(.top, 25)
                
                
                
                // Create a list of 3 Items
                VStack(spacing: 18) {
//                    ForEach(Array(options.keys), id: \.self) { key in
                    ForEach(sortingOptions, id: \.self) { key in
                        // Add divider between items
                        Divider()
                            .background(Color.gray.opacity(0.3))
                        Button(action: {
                            sortingOrder = key
                        }) {
                            HStack {
                                Text(options[key] ?? .defaultStr)
                                    .font(.getFont(name: .baskerville, size: 16))
                                    .foregroundColor(.black)
                                    .padding(.leading, 14)
                                
                                Spacer()
                                
                                // Checkmark icon for selected option
                                Image(systemName: sortingOrder == key ? "circle.fill" : "circle")
                                    .foregroundColor(sortingOrder == key ? .black : .gray)
                                    .padding(.trailing, 14)
                            }
                            .background(Color.white)
                        }
                        .frame(maxWidth: .infinity)
                        
                        
                    }
                }
                .background(Color.white)
                .padding(.top,20)
                
            }
        }
       
    }
}

#Preview {
    SortSheet(sortingOrder: .constant(SortingOrder.trending))
}
