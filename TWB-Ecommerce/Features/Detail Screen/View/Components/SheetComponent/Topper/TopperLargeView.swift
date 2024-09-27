//
//  TopperLargeView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 27/09/2024.
//

import SwiftUI

struct TopperLargeView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var selectedTopper: TopperItem
    let toppers: [TopperItem]
    
    var onSelectionDone: (TopperItem) -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            // Sticky header
            HStack {
                Text("Select Topper")
                    .font(.getFont(name: .libreBold, size: 16))
                
                Spacer()
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image("Close Button")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                        
                }
            }
            .padding(.top, 25)
            .padding(.horizontal)
            
            Divider()
                .frame(height: 1)
                .padding(.top,30)
            
            // List of toppers with radio buttons
            List(toppers, id: \.name) { topper in
                HStack {
                    Text(topper.name)
                        .font(.getFont(name: .libreRegular, size: 14))
                    
                    Text("(\(topper.price))")
                        .font(.getFont(name: .libreRegular, size: 14))
                        .foregroundColor(Constants.gray)
                    
                    Spacer()
                    
                    // Radio button for selection
                    Image(systemName: selectedTopper.name == topper.name ? "largecircle.fill.circle" : "circle")
                        .foregroundColor(selectedTopper.name == topper.name ? .black : .gray)
                }
                .padding(.vertical)
                .contentShape(Rectangle())  // Make the entire row tappable
                .onTapGesture {
                    withAnimation {
                        // Update the selected topper
                        selectedTopper = topper
                        // Call the callback with the updated topper value
                        onSelectionDone(topper)
                    }
                }
            }
            .listStyle(PlainListStyle())
        }
    }
}

#Preview {
    @Previewable @State var selectedTopper = TopperItem(name: "Customized Topper (3 Working Days)", price: "AED 83")
    
    TopperLargeView(
        selectedTopper: $selectedTopper,
        toppers: [
            TopperItem(name: "Customized Topper (3 Working Days)", price: "AED 83"),
            TopperItem(name: "52 UAE", price: "AED 32"),
            TopperItem(name: "Love You", price: "AED 32"),
            TopperItem(name: "Happy Birthday", price: "AED 32"),
            TopperItem(name: "Hajj Mubarak", price: "AED 32"),
            TopperItem(name: "Get Well Soon", price: "AED 32"),
            TopperItem(name: "Thank You", price: "AED 32"),
            TopperItem(name: "Happy Anniversary", price: "AED 32"),
            TopperItem(name: "Best Wishes", price: "AED 32")
        ],
        onSelectionDone: { topper in
            print("Selected Topper: \(topper.name)")
        }
    )
}
