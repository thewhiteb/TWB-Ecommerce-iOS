//
//  AddToBagView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 04/10/2024.
//

import SwiftUI

struct AddToBagView: View {
    @Environment(\.presentationMode) var presentationMode
    
    // Add a dictionary for add-ons types and their related products
    let addOnsTypeList = ["Chocolates", "Perfumes", "Small Cakes", "Bouquets", "Balloons"]
    
    // Sample items related to each add-on type
    let itemsByType: [String: [TrendingProduct]] = [
        "Chocolates": [
            TrendingProduct(images: ["Bouquet1", "Bouquet1", "Bouquet1"], itemName: "Dessert Acrylic 012", itemPrice: "AED 267", isCustomizable: true),
            TrendingProduct(images: ["Bouquet1", "Bouquet1", "Bouquet1"], itemName: "Dessert Box Small 015", itemPrice: "AED 137", isCustomizable: false),
            TrendingProduct(images: ["Bouquet1", "Bouquet1", "Bouquet1"], itemName: "Chocolate Box Grande 101", itemPrice: "AED 300", isCustomizable: true),
            TrendingProduct(images: ["Bouquet1", "Bouquet1", "Bouquet1"], itemName: "Truffle Delight Box 011", itemPrice: "AED 195", isCustomizable: false),
            TrendingProduct(images: ["Bouquet1", "Bouquet1", "Bouquet1"], itemName: "Luxury Choco Set 202", itemPrice: "AED 400", isCustomizable: true),
            TrendingProduct(images: ["Bouquet1", "Bouquet1", "Bouquet1"], itemName: "Chocolate Hamper 005", itemPrice: "AED 215", isCustomizable: false)
        ],
        "Perfumes": [
            TrendingProduct(images: ["Bouquet1", "Bouquet1", "Bouquet1"], itemName: "Luxury Perfume 011", itemPrice: "AED 500", isCustomizable: false)
        ],
        "Small Cakes": [
            TrendingProduct(images: ["Bouquet1", "Bouquet1", "Bouquet1"], itemName: "Mini Cake Set", itemPrice: "AED 180", isCustomizable: false)
        ],
        "Bouquets": [
            TrendingProduct(images: ["Bouquet1", "Bouquet1", "Bouquet1"], itemName: "Luxury Bouquet", itemPrice: "AED 500", isCustomizable: false)
        ],
        "Balloons": [
            TrendingProduct(images: ["Bouquet1", "Bouquet1", "Bouquet1"], itemName: "Birthday Balloons", itemPrice: "AED 80", isCustomizable: false)
        ]
    ]
    
    // Track the selected add-on type (initially set to "Chocolates")
    @State private var selectedAddOns: String = "Chocolates"
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("tick_added")
                Text("Successfully Added To Your Bag")
                    .font(.getFont(name: .libreRegular, size: 12))
                
                Spacer()
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image("Close Button")
                        .frame(width: 24, height: 24)
                }
            }
            .padding(.top, 20)
            .padding()
            
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Constants.grayBorder)
                .padding(.horizontal)
            
            Text("Enhance your Gift Experience")
                .font(.getFont(name: .libreBold, size: 16))
                .padding(.top, 10)
                .padding(.horizontal)
            
            // First ScrollView for selecting the add-on type
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(addOnsTypeList, id: \.self) { addOnType in
                        ZStack {
                            Rectangle()
                                .fill(selectedAddOns == addOnType ? Color.black : Color.clear)
                                .frame(height: 40)
                                .overlay(
                                    Rectangle()
                                        .stroke(selectedAddOns == addOnType ? Color.black : Constants.grayBorder, lineWidth: 1)
                                )
                            
                            Text(addOnType)
                                .font(.getFont(name: .libreRegular, size: 12))
                                .foregroundColor(selectedAddOns == addOnType ? .white : Constants.gray)
                                .padding(.horizontal, 10)
                        }
                        .onTapGesture {
                            selectType(addOnType)
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 15)
            }
            
            // Second ScrollView for displaying the items based on the selected add-on type
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 5) {
                    // Filter items based on the selected add-on type
                    ForEach(itemsByType[selectedAddOns] ?? [], id: \.self) { item in
                        AddOnItems(
                            images: item.images,
                            itemName: item.itemName,
                            itemPrice: item.itemPrice,
                            isCustomizable: item.isCustomizable
                        )
                    }
                }
                .padding(.horizontal)
            }
            
            Spacer()
            
            HStack(spacing: 10) {
                AddToBagButton(action: {
                    // See results action
                }, text: "View Bag", imageName: "bag")
            }
            .padding()
            .background(Color.white)
            .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 1)
        }
    }
    
    // Function to handle type selection
    private func selectType(_ addOnType: String) {
        selectedAddOns = addOnType
    }
}

#Preview {
    AddToBagView()
}
