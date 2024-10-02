//
//  FlowersDropDownView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 24/09/2024.
//

import SwiftUI

struct FlowersDropDownView: View {
    @Binding var selectedFlowerNames: [String]  // Binding to pass selected flower names to the parent view
    @State private var isExpanded: Bool = false
    @State private var showAll: Bool = false  // Track if the user wants to see all items

    let flowers: [Flowers] = [
        Flowers(name: "Rose", count: "06"),
        Flowers(name: "Hydrangea", count: "05"),
        Flowers(name: "Lilly", count: "24"),
        Flowers(name: "Tulip", count: "22"),
        Flowers(name: "Peony", count: "05")
    ]

    var body: some View {
        VStack(alignment: .leading) {
            // Header with toggle action for expand/collapse
            HStack {
                Text("Flowers Type")
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

            // Flower list with animation for expand/collapse
            if isExpanded {
                VStack {
                    // Only show the first 3 items when showAll is false, otherwise show all
                    let visibleFlowers = showAll ? flowers : Array(flowers.prefix(3))

                    ForEach(visibleFlowers) { flower in
                        HStack {
                            // Checkmark box
                            Button {
                                toggleSelection(for: flower)
                            } label: {
                                Image(selectedFlowerNames.contains(flower.name) ? "checked" : "unchecked")
                                    .foregroundColor(.gray)
                                    .frame(width: 18, height: 18)
                            }

                            // Flower name
                            Text(flower.name)
                                .font(Font.custom("Baskerville", size: 14))

                            Spacer()

                            // Flower count
                            Text(flower.count)
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
    private func toggleSelection(for flower: Flowers) {
        if selectedFlowerNames.contains(flower.name) {
            selectedFlowerNames.removeAll(where: { $0 == flower.name })  // Remove name from array
        } else {
            selectedFlowerNames.append(flower.name)  // Add name to array
        }
    }
}

//#Preview {
//    @State var selectedFlowerNames: [String] = []
//    FlowersDropDownView(selectedFlowerNames: $selectedFlowerNames)
//}

