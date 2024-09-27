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
    let selectedLetters: [String]  // Pass the selected letters to this view
       
       var body: some View {
           VStack(spacing: 0) {
               // Sticky header
               VStack(spacing: 0) {
                   HStack {
                       Text("Select Letter(s)")
                           .font(
                            .getFont(name: .libreBold, size: 16)
                           )
                           
                       Spacer()
                       Button(action: {
                           presentationMode.wrappedValue.dismiss()
                       }) {
                           Text("Done")
                               .font(.getFont(name: .latoBold,size: 13))
                       }
                   }
                   .padding(.top, 25)
                   .padding(.horizontal)
                   
               }
               .background(Color.white)
               .shadow(color: Color.black.opacity(showShadow ? 0.3 : 0), radius: 3, x: 0, y: 3)  // Shadow that appears when scrolling
               .animation(.easeInOut, value: showShadow)  // Animate shadow appearance
               
               Spacer()
           }
       }
}

#Preview {
    LetterLargeView(selectedLetters: ["A", "B", "C"])
}
