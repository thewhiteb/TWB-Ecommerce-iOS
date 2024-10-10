//
//  LetterLargeView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 27/09/2024.
//

import SwiftUI

struct LetterLargeView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var showShadow: Bool = false
    
    // Allow multiple selection and maximum selection count
    let allowMultipleSelection: Bool
    let maxSelectionCount: Int
    
    // Binding to reflect changes in selected letters immediately
    @Binding var selectedLetters: [String]
    
    // Alphabet array
    let alphabet = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
    
    // Grid layout: 5 columns with flexible width
    private let gridLayout = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            // Sticky header
            VStack(spacing: 0) {
                HStack {
                    Text("Select Letter(s)")
                        .font(.getFont(name: .libreBold, size: 16))
                    
                    Spacer()
                    
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Done")
                            .font(.getFont(name: .latoBold, size: 13))
                            .foregroundColor(Constants.black)
                    }
                }
                .padding(.top, 25)
                .padding(.horizontal)
            }
            .background(Color.white)
            .shadow(color: Color.black.opacity(showShadow ? 0.3 : 0), radius: 3, x: 0, y: 3)
            .animation(.easeInOut, value: showShadow)
            
            // Grid view for the alphabet
            ScrollView {
                LazyVGrid(columns: gridLayout, spacing: 15) {
                    ForEach(alphabet, id: \.self) { letter in
                        ZStack {
                            // Black background for selected letters, gray border otherwise
                            Rectangle()
                                .fill(selectedLetters.contains(String(letter)) ? Color.black : Color.clear)
                                .frame(width: 50, height: 50)
                                .overlay(
                                    Rectangle()
                                        .stroke(selectedLetters.contains(String(letter)) ? Color.black : Color.gray, lineWidth: 1)
                                )
                                .shadow(color: selectedLetters.contains(String(letter)) ? Color.black.opacity(0.2) : Color.clear, radius: 2)
                            
                            Text(String(letter))
                                .font(.getFont(name: .libreRegular, size: 14))
                                .foregroundColor(selectedLetters.contains(String(letter)) ? .white : Constants.gray)
                        }
                        .onTapGesture {
                            selectLetter(String(letter))
                        }
                    }
                }
                .padding()
            }
            .padding(.top, 32)
            
            Spacer()
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
    @Previewable @State var selectedLettersPreview = ["A", "B"]
    
    return LetterLargeView(
        allowMultipleSelection: true,
        maxSelectionCount: 3,
        selectedLetters: $selectedLettersPreview  // Pass the binding here
    )
}
