//
//  ColorDropdownView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 24/09/2024.
//

import SwiftUI

struct ColorDropdownView: View {
    @Binding var selectedColors: [String]  // Binding to pass selected color names to the parent view
    @State private var isExpanded: Bool = false  // Control the expand/collapse state
    
    let colors: [ColorOption] = [
        ColorOption(name: "Red", color: .red),
        ColorOption(name: "Pink", color: .pink),
        ColorOption(name: "Purple", color: .purple),
        ColorOption(name: "Yellow", color: .yellow),
        ColorOption(name: "Orange", color: .orange),
        ColorOption(name: "Green", color: .green),
        ColorOption(name: "Cyan", color: .cyan),
        ColorOption(name: "Brown", color: .brown)
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            
            // Header for the section with expand/collapse toggle
            HStack {
                Text("Colors")
                    .font(Font.custom("Baskerville", size: 16))
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                Spacer()
                
                // Expand/collapse icon
                Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                    .foregroundColor(.gray)
            }
            .contentShape(Rectangle()) // Make the whole header tappable
            .onTapGesture {
                withAnimation(.easeInOut) {
                    isExpanded.toggle()  // Toggle expand/collapse
                }
            }
            
            // Display colors if expanded
            if isExpanded {
                // Horizontal scrollable color circles
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(colors) { colorOption in
                            Button(action: {
                                withAnimation(.easeInOut) {  // Add animation when toggling selection
                                    toggleSelection(for: colorOption)
                                }
                            }) {
                                ZStack {
                                    Circle()
                                        .fill(colorOption.color)
                                        .frame(width: 40, height: 40)
                                    
                                    // Show a checkmark and outer circle with animation
                                    if selectedColors.contains(colorOption.name) {
                                        Circle()
                                            .stroke(Color.black, lineWidth: 1)
                                            .frame(width: 45, height: 45)
                                            .transition(.opacity)  // Animate circle appearance with fading
                                        
                                        Image(systemName: "checkmark")
                                            .foregroundColor(.black)
                                            .transition(.scale.combined(with: .opacity)) // Animate checkmark with scale and opacity
                                    }
                                }
                            }
                            .frame(width: 50, height: 50)
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.top, 10)
                .transition(.slide) // Add slide transition
            }
        }
        .padding()
    }
    
    // Function to toggle the selection
    private func toggleSelection(for colorOption: ColorOption) {
        if selectedColors.contains(colorOption.name) {
            selectedColors.removeAll { $0 == colorOption.name }  // Deselect if already selected
        } else {
            selectedColors.append(colorOption.name)  // Select the color
        }
    }
}


// Preview
#Preview {
    @Previewable @State var selectedColors = [String]()
    ColorDropdownView(selectedColors: $selectedColors)
}
