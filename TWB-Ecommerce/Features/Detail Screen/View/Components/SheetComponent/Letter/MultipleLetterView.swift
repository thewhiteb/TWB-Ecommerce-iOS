//
//  MultipleLetterView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 03/10/2024.
//

import SwiftUI

struct MultipleLetterView: View {
    @Binding var text: String
    
    let letters = [
        LetterItem(name: "3 Letters", price: "AED 270"),
        LetterItem(name: "4 Letters", price: "AED 360"),
        LetterItem(name: "5 Letters", price: "AED 450"),
        LetterItem(name: "6 Letters", price: "AED 540"),
        
    ]
    
    @State private var selectedLetter: LetterItem = LetterItem(name: "Select Letter Quantity", price: "")  // Default selected topper
    @State private var showTopperLargeView = false  // State to show the large view
    
    // Callback to return the selected topper to the parent view
    var onSelectionChanged: (String) -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            // Header
            HStack {
                Text("Select Letter(s)")
                    .font(.getFont(name: .libreRegular, size: 13))
                    .fontWeight(.semibold)
                
                Spacer()
            }
            .padding(.horizontal)
            
            // Button to trigger the large topper sheet
            ZStack {
                Rectangle()
                    .fill(Color.clear)
                    .frame(height: 56)  // Set fixed height
                    .overlay(
                        Rectangle()
                            .stroke(Color(red: 0.85, green: 0.85, blue: 0.85), lineWidth: 1)
                    )
                
                HStack {
                    Text(selectedLetter.name)  // Show selected topper
                        .font(.getFont(name: .libreBold, size: 12))
                        .foregroundColor(Constants.gray)
                        .padding(.horizontal, 10)
                    
                    Spacer()
                    
                    if !selectedLetter.price.isEmpty{
                        Text(selectedLetter.price)
                            .font(.getFont(name: .libreBold, size: 12))
                            .foregroundColor(Constants.gray)
                    }
                    
                    
                    Image("DownArrow")
                        .padding(.horizontal, 10)
                }
            }
            .frame(height: 56)  // Ensure the height matches the TextField
            .padding(.horizontal)
            .padding(.top, 30)
            .onTapGesture {
                showTopperLargeView.toggle()  // Open the large view when tapped
            }
            .sheet(isPresented: $showTopperLargeView) {
                MultipleLetterSheet(
                    selectedLetter: $selectedLetter,
                    letters: letters,
                    onSelectionDone: { selected in
                        onSelectionChanged(selected.name)
                    }
                )
                .presentationDetents([.fraction(0.7), .medium])
            }
            
            if(selectedLetter.name != "Select Letter Quantity"){
                TextField("Input Customized Topper Text", text: $text)
                .font(.getFont(name: .libreRegular, size: 12))
                .frame(height: 56)  // Set fixed height to match the ZStack
                .padding(.horizontal, 10)
                .overlay(
                    RoundedRectangle(cornerRadius: 0)
                        .stroke(Color(red: 0.85, green: 0.85, blue: 0.85), lineWidth: 1)
                )
                    .padding(.horizontal)
                    .padding(.top, 10)
            }
                
                
        }
    }
}

#Preview {
    @Previewable @State var textFieldValue: String = ""
    MultipleLetterView(text: $textFieldValue, onSelectionChanged: { selectedTopper in
        print("Selected Topper: \(selectedTopper)")
    })
}
