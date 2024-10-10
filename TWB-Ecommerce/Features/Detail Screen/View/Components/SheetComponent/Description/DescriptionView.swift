//
//  DescriptionView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 02/10/2024.
//

import SwiftUI

struct DescriptionView: View {
    @State private var isExpanded = false  // Track if the view is expanded
    let description: DescriptionModel  // Pass the description model
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Header with title and toggle button
            HStack {
                Text("Description")
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
                    // Main description
                    Text(description.mainDescription)
                        .font(.getFont(name: .libreRegular, size: 12))
                        .foregroundColor(.black)
                        .padding(.top, 25)
                    
                    // Arrangement includes section
                    Text("Arrangement Includes")
                        .font(.getFont(name: .libreBold, size: 12))
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .padding(.top, 25)
                    
                    // Display each included arrangement item
                    ForEach(description.arrangementIncludes, id: \.self) { item in
                        HStack {
                            Text("- \(item)")
                                .font(.getFont(name: .libreRegular, size: 12))
                                .foregroundColor(.black)
                        }
                        .padding(.leading, 10)
                        .padding(.top, 15)
                    }
                    
                    // Note section
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Note:")
                            .font(.getFont(name: .libreBold, size: 12))
                            .foregroundColor(.black)
                        
                        Text(description.note)
                            .font(.getFont(name: .libreRegular, size: 12))
                            .foregroundColor(.black)
                    }
                    .padding()
                    .background(Color(white: 0.95))
                    .cornerRadius(8)  // Add corner radius to the note section
                    .padding(.top, 30)
                }
                .transition(.opacity.combined(with: .slide))  // Add slide and opacity transitions
            }
        }
        .padding()
        .background(Color.white)
    }
}

// Preview for testing
struct DescriptionView_Preview: PreviewProvider {
    static var previews: some View {
        // Sample description data
        let description = DescriptionModel(
            mainDescription: "A gift box arrangement comes with delicious chocolate-dipped strawberries guaranteed to delight your lucky recipient!",
            arrangementIncludes: ["Dessert Box Small", "Chocolate Dipped Strawberries"],
            note: "Depending on the season, we might change some flowers, but don't stress! If we do, the substitute will be just as nice or even better than you picked."
        )
        
        return DescriptionView(description: description)
            .previewLayout(.sizeThatFits)
    }
}
