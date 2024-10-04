//
//  ColorDropdownView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 24/09/2024.
//

import SwiftUI

struct ColorDropdownView: View {
    @Binding var selectedColor: String?  // Binding to pass the selected color name to the parent view
    @State private var isExpanded: Bool = false  // Control the expand/collapse state
    
    var title: String  // Pass title dynamically from parent view
    var isCollapsible: Bool  // Pass whether the view should be collapsible
    
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
                Text(title)  // Use the dynamic title
                    .font(Font.custom("Baskerville", size: 16))
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                Spacer()
                
                // Show the expand/collapse icon only if the view is collapsible
                if isCollapsible {
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .foregroundColor(.gray)
                }
            }
            .contentShape(Rectangle()) // Make the whole header tappable
            .onTapGesture {
                if isCollapsible {  // Toggle expand/collapse only if collapsible
                    withAnimation(.easeInOut) {
                        isExpanded.toggle()
                    }
                }
            }
            
            // Display colors if expanded or if the view is static
            if isExpanded || !isCollapsible {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(colors) { colorOption in
                            Button(action: {
                                withAnimation(.easeInOut) {  // Add animation when toggling selection
                                    toggleSelection(for: colorOption)
                                }
                            }) {
                                VStack{
                                    ZStack {
                                        Circle()
                                            .fill(colorOption.color)
                                            .frame(width: 40, height: 40)
                                        
                                        // Show a checkmark and outer circle with animation
                                        if selectedColor == colorOption.name {
                                            Circle()
                                                .stroke(Color.black, lineWidth: 1)
                                                .frame(width: 45, height: 45)
                                                .transition(.opacity)  // Animate circle appearance with fading
                                            
                                            Image(systemName: "checkmark")
                                                .foregroundColor(.black)
                                                .transition(.scale.combined(with: .opacity)) // Animate checkmark with scale and opacity
                                        }
                                    }
                                    .frame(width: 50, height: 50)
                                    
                                    Text(colorOption.name)
                                        .font(.getFont(name: .libreRegular, size: 10))
                                        .foregroundColor(.black)
                                }
                                
                            }
                            
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
        if selectedColor == colorOption.name {
            selectedColor = nil  // Deselect if the same color is tapped
        } else {
            selectedColor = colorOption.name  // Select the new color
        }
    }
}

#Preview {
    @Previewable @State var selectedColor: String? = nil
    ColorDropdownView(selectedColor: $selectedColor, title: "Colors", isCollapsible: true)
}
