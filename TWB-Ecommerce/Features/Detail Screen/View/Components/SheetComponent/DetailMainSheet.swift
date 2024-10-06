//
//  DetailMainSheet.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 27/09/2024.
//

import SwiftUI

struct DetailMainSheet: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var showShadow: Bool = false
    @State var customizedTextValue: String = ""
    @State private var showAddToCart: Bool = false
    
    var body: some View {
        
        VStack(spacing: 0) {
            // Sticky header
            VStack(spacing: 0) {
                HStack {
                    Text("Select Letter / Flavour / Topper")
                        .font(
                            .getFont(name: .libreBold, size: 16)
                        )
                        .padding(.horizontal)
                    Spacer()
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image("Close Button")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                            .padding(.horizontal)
                    }
                }
                .padding(.top, 25)
                                
            }
            .background(Color.white)
            .shadow(color: Color.black.opacity(showShadow ? 0.3 : 0), radius: 3, x: 0, y: 3)  // Shadow that appears when scrolling
            .animation(.easeInOut, value: showShadow)  // Animate shadow appearance
            
            ScrollView{
                
                LetterSmallView(allowMultipleSelection: false, maxSelectionCount: 5, onSelectionChanged: { selectedLetters in
                    print("Selected letters: \(selectedLetters)")
                })
                
                FlavourView(onSelectionChanged: { selectedFlavour in
                    print("Selected flavour: \(selectedFlavour)")
                })
                .padding(.top,30)
                
                TopperSmallView(text: $customizedTextValue, onSelectionChanged: { selectedTopper in
                    print("Selected Topper: \(selectedTopper)")
                })
                .padding(.top,30)
            }
            .padding(.top,32)
            Spacer()
            
            // Make the buttons sticky at the bottom
            HStack(spacing: 10) {
                AddToBagButton(action: {
                    showAddToCart.toggle()
                }, text: "Add to Bag",imageName: "bag")
            }
            .padding()
            .background(Color.white)  // Background for the buttons
            .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 1)  // Add shadow to the bottom buttons
            .sheet(isPresented : $showAddToCart){
                AddToBagView()
                .presentationDetents([.fraction(0.6), .large])
            }
            
        }
    }
}

#Preview {
    DetailMainSheet()
}
