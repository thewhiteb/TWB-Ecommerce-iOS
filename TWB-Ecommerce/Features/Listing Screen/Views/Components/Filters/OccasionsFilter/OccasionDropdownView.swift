//
//  OccasionDropdownView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 24/09/2024.
//

import SwiftUI

struct OccasionDropdownView: View {
    @Binding var selectedOccasionNames: [String]  // Binding to pass selected occasion names to the parent view
    @State private var isExpanded: Bool = false
    @State private var showAll: Bool = false  // Track if the user wants to see all items
    
    let occasions: [Occasion] = [
        Occasion(name: "Thank You", count: "06"),
        Occasion(name: "Happy Anniversary", count: "05"),
        Occasion(name: "I Love You", count: "24"),
        Occasion(name: "Happy Birthday", count: "22"),
        Occasion(name: "Welcome Back", count: "05")
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            // Header with toggle action for expand/collapse
            HStack {
                Text("Occasions")
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
            
            // Occasion list with animation for expand/collapse
            if isExpanded {
                VStack {
                    // Only show the first 3 items when showAll is false, otherwise show all
                    let visibleOccasions = showAll ? occasions : Array(occasions.prefix(3))
                    
                    ForEach(visibleOccasions) { occasion in
                        HStack {
                            // Checkmark box
                            Button {
                                toggleSelection(for: occasion)
                            } label: {
                                Image(selectedOccasionNames.contains(occasion.name) ? "checked" : "unchecked")
                                    .foregroundColor(.gray)
                                    .frame(width: 18, height: 18)
                            }
                            
                            // Occasion name
                            Text(occasion.name)
                                .font(Font.custom("Baskerville", size: 14))
                            
                            Spacer()
                            
                            // Occasion count
                            Text(occasion.count)
                                .font(Font.custom("Baskerville", size: 16))
                                .foregroundColor(.gray)
                        }
                        .padding(.horizontal)
                        .padding(.top, 5)
                    }
                    
                    HStack {
                        // "Show More" or "Show Less" button
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
    
    // Function to toggle selection and update the binding array
    private func toggleSelection(for occasion: Occasion) {
        if selectedOccasionNames.contains(occasion.name) {
            selectedOccasionNames.removeAll(where: { $0 == occasion.name })  // Remove name from array
        } else {
            selectedOccasionNames.append(occasion.name)  // Add name to array
        }
    }
}

//#Preview {
//    @State var selectedOccasionNames: [String] = []
//    OccasionDropdownView(selectedOccasionNames: $selectedOccasionNames)
//}
