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
            
            AddToBagButtonView()
            
        }
    }
}

#Preview {
    DetailMainSheet()
}
