//
//  SimpleGiftOccasionList.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 10/09/2024.
//

import SwiftUI

struct SimpleGiftOccasionList: View {
    
    // Sample list of items
    @State private var items: [ItemModel] = [
        ItemModel(imageName: "GiftCake3", itemText: "Class of 2024"),
        ItemModel(imageName: "GiftCake3", itemText: "Eid and Hajj Collection"),
        ItemModel(imageName: "GiftCake3", itemText: "Father's Day"),
        ItemModel(imageName: "GiftCake3", itemText: "Thank You"),
        ItemModel(imageName: "GiftCake3", itemText: "Happy Anniversary"),
        ItemModel(imageName: "GiftCake3", itemText: "Welcome Back"),
        ItemModel(imageName: "GiftCake3", itemText: "Best Wishes"),
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                // Use FirstItemView for the first item
                if let firstItem = items.first {
                    FirstItemView(item: firstItem)
                }
                
                // Use ItemView for the remaining items
                ForEach(items.dropFirst()) { item in
                    ItemView(item: item)
                }
            }
            .padding(.horizontal, 10)
        }
        .frame(height: 250) // Adjusted height to fit the content
    }
}

// Separate view for the first item
struct FirstItemView: View {
    var item: ItemModel
    
    var body: some View {
        ZStack {
            HStack {
                Text("Class of\n2024")
                    .font(Font.custom("Baskerville", size: 24))
                    .foregroundColor(.black)
                    .padding(30)
                
                Spacer()
                
            }
            
            Image(item.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200) // Larger image but within the frame limit
                .clipped()// Ensures that the image stays within its frame
                .offset(x:50)
            
        }
        .frame(width: 287, height: 250) // Larger frame for first item
        .background(Color(red: 0.85, green: 0.85, blue: 0.85)) // Different background color for first item
        
    }
}

// Separate ItemView struct to handle individual item display
struct ItemView: View {
    var item: ItemModel
    
    var body: some View {
        ZStack {
            VStack {
                Text(item.itemText)
                    .font(Font.custom("Baskerville", size: 14))
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .frame(width: 120, alignment: .top) // Standard width
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .padding(.top, 20)
                
                Spacer()
                
                Image(item.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 180) // Standard image height
            }
        }
        .frame(width: 142, height: 250) // Standard frame for remaining items
        .background(Color(red: 0.85, green: 0.85, blue: 0.85))
    }
}


#Preview {
    SimpleGiftOccasionList()
}

