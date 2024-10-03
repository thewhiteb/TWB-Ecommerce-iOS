//
//  LetterSmallView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 27/09/2024.
//

import SwiftUI

struct LetterSmallView: View {
    let alphabet = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")  // Alphabet array
    
    // The parent view will pass whether multiple selection is allowed or not.
    let allowMultipleSelection: Bool
    let maxSelectionCount: Int
    
    // Callback to return the selected characters to the parent view
    var onSelectionChanged: ([String]) -> Void
    
    // Track selected characters
    @State private var selectedLetters: [String] = []
    
    // Track if the Quick View sheet is presented
    @State private var isQuickViewPresented: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            // Header
            HStack {
                Text("Letter(s)")
                    .font(.getFont(name: .libreRegular, size: 13))
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button(action: {
                    // Present the Quick View sheet
                    isQuickViewPresented.toggle()
                }) {
                    Text("Quick View")
                        .font(.getFont(name: .libreRegular, size: 12))
                        .fontWeight(.semibold)
                        .foregroundColor(Constants.bloodRed)
                        .underline()
                }
                .sheet(isPresented: $isQuickViewPresented) {
                    LetterLargeView(
                        allowMultipleSelection: allowMultipleSelection,
                        maxSelectionCount: maxSelectionCount,
                        selectedLetters: $selectedLetters  
                    )
                    .presentationDetents([.fraction(0.7), .large])
                }
            }
            .padding(.horizontal)
            
            // Scrollable alphabet view
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(alphabet, id: \.self) { letter in
                        ZStack {
                            // Black background for selected letters, gray border otherwise
                            Rectangle()
                                .fill(selectedLetters.contains(String(letter)) ? Color.black : Color.clear)  // Black background when selected
                                .frame(width: 50, height: 50)
                                .overlay(
                                    Rectangle()
                                        .stroke(selectedLetters.contains(String(letter)) ? Color.black : Color.gray, lineWidth: 1)
                                )
                                
                            Text(String(letter))
                                .font(.getFont(name: .libreRegular, size: 14))
                                .foregroundColor(selectedLetters.contains(String(letter)) ? .white : Constants.gray)  // White text on black background
                        }
                        .onTapGesture {
                            selectLetter(String(letter))
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 30)
            }
        }
        // Whenever selected letters change, notify the parent via the callback
        .onChange(of: selectedLetters) { newSelectedLetters in
            onSelectionChanged(newSelectedLetters)
        }
    }
    
    // Function to handle letter selection
    private func selectLetter(_ letter: String) {
        if selectedLetters.contains(letter) {
            selectedLetters.removeAll { $0 == letter }
        } else {
            if allowMultipleSelection {
                if selectedLetters.count < maxSelectionCount {
                    selectedLetters.append(letter)
                }
            } else {
                selectedLetters = [letter]  // Single selection
            }
        }
    }
}


#Preview {
    LetterSmallView(allowMultipleSelection: false, maxSelectionCount: 3, onSelectionChanged: { selectedLetters in
        print("Selected letters: \(selectedLetters)")
    })
}
