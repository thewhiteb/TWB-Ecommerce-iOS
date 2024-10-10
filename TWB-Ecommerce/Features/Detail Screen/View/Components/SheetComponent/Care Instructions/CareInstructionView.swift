//
//  CareInstructionView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 04/10/2024.
//

import SwiftUI

struct CareInstructionView: View {
    @State private var isExpanded = false  // Track if the view is expanded
    let careInstruction: CareInstructionModel  // Pass the description model
    
    
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Header with title and toggle button
            HStack {
                Text("Flower Care Instructions")
                    .font(.getFont(name: .libreBold, size: 12))
                    .foregroundColor(.black)
                
                Spacer()
                
                // Button to toggle expanded/collapsed state
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.3)) {  // Add animation with easeInOut
                        isExpanded.toggle()
                    }
                }) {
                    Image(systemName: isExpanded ? "minus" : "plus")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.black)
                }
            }
            
            // Conditional view content based on whether it's expanded or not
            if isExpanded {
                VStack(alignment: .leading, spacing: 8) {

                    // Display each included arrangement item
                    ForEach(careInstruction.mainDescription.components(separatedBy: "\n"), id: \.self) { line in
                        let trimmedLine = line.trimmingCharacters(in: .whitespacesAndNewlines)  // Trim the whitespace and newlines
                        if !trimmedLine.isEmpty {
                            HStack {
                                Text("- \(trimmedLine)")
                                    .font(.getFont(name: .libreRegular, size: 12))
                                    .foregroundColor(.black)
                            }
                            .padding(.leading, 10)
                            .padding(.top, 15)
                        }
                    }

     
                }
                .transition(.opacity.combined(with: .slide))  // Add slide and opacity transitions
            }
        }
        .padding()
        .background(Color.white)
    }
}

// Preview for testing
struct CareInstructions_Preview: PreviewProvider {
    static var previews: some View {
        // Sample description data
        let description = CareInstructionModel(
            mainDescription: "A gift box arrangement comes with delicious chocolate-dipped strawberries guaranteed to delight your lucky recipient! \n Second Line \n \n Third Line"
        )
        
        return CareInstructionView(careInstruction: description)
            .previewLayout(.sizeThatFits)
    }
}
