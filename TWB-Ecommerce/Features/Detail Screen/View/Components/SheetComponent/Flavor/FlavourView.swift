//
//  FlavourView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 27/09/2024.
//

import SwiftUI

struct FlavourView: View {
    // List of flavors
    let flavours = ["Vanilla Mistikkah", "Choco Peanuts", "Pistachio", "Strawberry Delight", "Mango Tango", "Coconut Crunch"]
    
    // Callback to return the selected flavour to the parent view
    var onSelectionChanged: (String) -> Void
    
    // Track the selected flavour
    @State private var selectedFlavour: String? = nil
    
    var body: some View {
        VStack(alignment: .leading) {
            // Header
            HStack {
                Text("Choose Flavour")
                    .font(.getFont(name: .libreBold, size: 16))
                
                
                Spacer()
                
            }
            .padding(.horizontal)
            
            // Scrollable flavour view
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(flavours, id: \.self) { flavour in
                        ZStack {
                            // Black background for selected flavour, gray border otherwise
                            Rectangle()
                                .fill(selectedFlavour == flavour ? Color.black : Color.clear)  // Black background when selected
                                .frame(height:  50)
                                .overlay(
                                    Rectangle()
                                        .stroke(selectedFlavour == flavour ? Color.black : Color.gray, lineWidth: 1)
                                )
                            
                                .shadow(color: selectedFlavour == flavour ? Color.black.opacity(0.2) : Color.clear, radius: 2)
                                
                            Text(flavour)
                                .font(.getFont(name: .libreRegular, size: 14))
                                .foregroundColor(selectedFlavour == flavour ? .white : Constants.gray)  // White text on black background
                                .padding(.horizontal, 7)
                        }
                        .onTapGesture {
                            selectFlavour(flavour)
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 10)
            }
        }
       
    }
    
    // Function to handle flavour selection (single selection)
    private func selectFlavour(_ flavour: String) {
        if selectedFlavour == flavour {
            selectedFlavour = nil  // Deselect if the same flavour is tapped again
        } else {
            selectedFlavour = flavour  // Set the selected flavour
        }
        
        // Call the callback to notify the parent view of the selected flavour
        onSelectionChanged(selectedFlavour ?? "")
    }
}

#Preview {
    FlavourView(onSelectionChanged: { selectedFlavour in
        print("Selected flavour: \(selectedFlavour)")
    })
}

