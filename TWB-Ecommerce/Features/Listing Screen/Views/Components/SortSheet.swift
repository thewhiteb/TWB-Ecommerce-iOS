//
//  SortSheet.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 24/09/2024.
//

import SwiftUI

struct SortSheet: View {
    @Environment(\.presentationMode) var presentationMode
    
    // List of options
    let options = [
        (title: "Top Seller", image: "Message"),
        (title: "Trending", image: "Whatsapp"),
        (title: "Newest", image: "Email"),
        (title: "Lowest Price", image: "Email"),
        (title: "Highest Price", image: "Email")
    ]
    
    @State private var selectedOption: Int? = nil  // Track the selected option
    
    var body: some View {
        
        ScrollView {
            VStack {
                HStack {
                    Text("Sort By")
                        .font(.custom("Baskerville", size: 18))
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
                    ForEach(0..<options.count, id: \.self) { index in
                        
                        // Add divider between items
                        
                        Divider()
                            .background(Color.gray.opacity(0.3))
                        
                        Button(action: {
                            selectedOption = index
                        }) {
                            HStack {
                                Text(options[index].title)
                                    .font(Font.custom("Baskerville", size: 16))
                                    .foregroundColor(.black)
                                    .padding(.leading, 14)
                                
                                Spacer()
                                
                                // Checkmark icon for selected option
                                Image(systemName: selectedOption == index ? "circle.fill" : "circle")
                                    .foregroundColor(selectedOption == index ? .black : .gray)
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
    SortSheet()
}
