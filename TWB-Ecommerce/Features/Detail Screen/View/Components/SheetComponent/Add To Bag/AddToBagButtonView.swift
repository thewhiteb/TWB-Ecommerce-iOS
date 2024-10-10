//
//  AddToBagButtonView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 07/10/2024.
//

import SwiftUI

struct AddToBagButtonView: View {
    
    @State private var showAddToCart: Bool = false
    
    var body: some View {
        // Make the buttons sticky at the bottom
        HStack(spacing: 10) {
            AddToBagButton(action: {
                showAddToCart.toggle()
            }, text: "Add to Bag",imageName: "bag")
            .sheet(isPresented: $showAddToCart) {
                AddToBagView()
                    .presentationDetents([.fraction(0.7), .large])
            }
        }
        .padding()
        .background(Color.white)  // Background for the buttons
        .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 1)  // Add shadow to the bottom buttons
        
    }
}

#Preview {
    AddToBagButtonView()
}
