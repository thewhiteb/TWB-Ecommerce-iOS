//
//  PriceDropDownView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 24/09/2024.
//

import SwiftUI

struct PriceDropDownView: View {
    @Binding var selectedPriceName: String?  // Binding to pass selected price name to the parent view
    @State private var isExpanded: Bool = false
    @State private var showAll: Bool = false  // Track if the user wants to see all items
    
    let prices: [Prices] = [
        Prices(name: "Below 500", count: "50"),
        Prices(name: "Below 1000", count: "30"),
        Prices(name: "Below 1500", count: "20"),
        Prices(name: "Below 2000", count: "10"),
        Prices(name: "Above 2000", count: "5")
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            
            // Header with toggle action for expand/collapse
            HStack {
                Text("Prices")
                    .font(Font.custom("Baskerville", size: 16))
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                Spacer()
                
                Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                    .foregroundColor(.gray)
            }
            .contentShape(Rectangle())  // Make entire HStack tappable
            .onTapGesture {
                withAnimation(.easeInOut) {
                    isExpanded.toggle()  // Toggle expand/collapse with animation
                }
            }
            
            // Prices list with animation for expand/collapse
            if isExpanded {
                VStack {
                    // Show either the first 3 prices or all prices based on the 'showAll' state
                    let visiblePrices = showAll ? prices : Array(prices.prefix(3))
                    
                    ForEach(visiblePrices) { price in
                        HStack {
                            // Radio button (checkmark for the selected price)
                            Button {
                                toggleSelection(for: price)
                            } label : {
                                Image(selectedPriceName == price.name ? "checked" : "unchecked")
                                    .foregroundColor(.gray)
                                    .frame(width: 18, height: 18)
                            }
                            
                            // Price name
                            Text(price.name)
                                .font(Font.custom("Baskerville", size: 14))
                            
                            Spacer()
                            
                            // Price count (number of items in that range)
                            Text(price.count)
                                .font(Font.custom("Baskerville", size: 16))
                                .foregroundColor(.gray)
                        }
                        .padding(.horizontal)
                        .padding(.top, 5)
                    }
                    
                    // Show More / Show Less button
                    HStack {
                        Button(action: {
                            withAnimation(.easeInOut) {
                                showAll.toggle()  // Toggle between showing all items and showing only the first 3
                            }
                        }) {
                            Text(showAll ? "Show Less" : "Show More")
                                .font(Font.custom("Baskerville", size: 16))
                                .underline()
                                .foregroundColor(.black)
                        }
                        .padding(.horizontal)
                        .padding(.top, 10)
                        
                        Spacer()
                    }
                }
                .transition(.slide)  // Apply a slide transition for smooth appearance/disappearance
                .animation(.easeInOut, value: isExpanded)  // Animate expand/collapse
            }
        }
        .padding()
    }
    
    // Function to toggle selection, allowing only one item to be selected at a time
    private func toggleSelection(for price: Prices) {
        if selectedPriceName == price.name {
            selectedPriceName = nil  // Deselect if already selected
        } else {
            selectedPriceName = price.name  // Select the new price
        }
    }
}

#Preview {
    @State var selectedPriceName: String? = nil
    PriceDropDownView(selectedPriceName: $selectedPriceName)
}
