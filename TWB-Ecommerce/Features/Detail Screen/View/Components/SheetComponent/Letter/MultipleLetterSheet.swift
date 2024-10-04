//
//  MultipleLetterSheet.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 03/10/2024.
//

import SwiftUI

struct MultipleLetterSheet: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var selectedLetter: LetterItem
    let letters: [LetterItem]
    
    var onSelectionDone: (LetterItem) -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            // Sticky header
            HStack {
                Text("Select Letter Quantity")
                    .font(.getFont(name: .libreBold, size: 16))
                
                Spacer()
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image("Close Button")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                        
                }
            }
            .padding(.top, 25)
            .padding(.horizontal)
            
            Divider()
                .frame(height: 1)
                .padding(.top,30)
            
            // List of toppers with radio buttons
            List(letters, id: \.name) { letter in
                HStack {
                    Text(letter.name)
                        .font(.getFont(name: .libreRegular, size: 14))
                    if !letter.price.isEmpty{
                        Text("(\(letter.price))")
                            .font(.getFont(name: .libreRegular, size: 14))
                            .foregroundColor(Constants.gray)
                    }
                   
                    
                    Spacer()
                    
                    // Radio button for selection
                    Image(systemName: selectedLetter.name == letter.name ? "largecircle.fill.circle" : "circle")
                        .foregroundColor(selectedLetter.name == letter.name ? .black : .gray)
                }
                .padding(.vertical)
                .contentShape(Rectangle())  // Make the entire row tappable
                .onTapGesture {
                    withAnimation {
                        // Update the selected topper
                        selectedLetter = letter
                        // Call the callback with the updated topper value
                        onSelectionDone(letter)
                    }
                }
            }
            .listStyle(PlainListStyle())
        }
    }
}

#Preview {
    @Previewable  @State  var selectedLetter: LetterItem = LetterItem(name: "Choose Letters", price: "")
    
    MultipleLetterSheet(
        selectedLetter: $selectedLetter,
        letters: [
            LetterItem(name: "3 Letters", price: "AED 270"),
            LetterItem(name: "4 Letters", price: "AED 360"),
            LetterItem(name: "5 Letters", price: "AED 450"),
            LetterItem(name: "6 Letters", price: "AED 540"),
            
        ],
        onSelectionDone: { letter in
            print("Selected Topper: \(letter.name)")
        }
    )
}
