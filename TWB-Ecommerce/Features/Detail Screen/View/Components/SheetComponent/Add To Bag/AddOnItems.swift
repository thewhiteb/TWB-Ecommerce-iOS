//
//  AddOnItems.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 04/10/2024.
//

import SwiftUI

struct AddOnItems: View {
    let images: [String] // Array of image names
    let itemName: String
    let itemPrice: String
    let isCustomizable: Bool
    
    @State private var currentPage = 0
    @State private var count: Int = 0
    @State private var isExpanded: Bool = false
    @State private var isPlusButtonPressed: Bool = false
    
    
    var body: some View {
        
        ZStack (alignment : .bottomTrailing){
            VStack(spacing: 0) {
                ZStack {
                    // Image slider using TabView
                    TabView(selection: $currentPage) {
                        ForEach(0..<images.count, id: \.self) { index in
                            Image(images[index])
                                .resizable()
                                .scaledToFit()
                                .frame(width: 170, height: 200) // Fixed height, dynamic width
                                .clipped()
                                .tag(index)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // Hide default page indicator
                    .frame(width: 170, height: 200) // Fixed height for image slider
                    
                    // Custom page indicator dots
                    VStack {
                        Spacer()
                        HStack(spacing: 5) { // Customize the spacing between indicators
                            ForEach(0..<images.count, id: \.self) { index in
                                Circle()
                                    .frame(width: currentPage == index ? 8 : 6, height: currentPage == index ? 8 : 6)
                                    .foregroundColor(currentPage == index ? .black : .gray)
                            }
                        }
                        .padding(.bottom, 10)
                    }
                    
                    HStack {
                        Spacer()
                        
                        VStack {
                            TwitterHeart(width: 24, height: 24, imageIcon: "SmallEmptyHeart")
                                .padding(.top, 15)
                                .padding(.trailing, 10)
                            Spacer()
                        }
                    }
                    
                }
                .background(Color(hex: "#F5F5F5"))
                
                
                // Item name
                Text(itemName)
                    .font(Font.custom("Baskerville", size: 12))
                    .foregroundColor(.black)
                    .padding(.top, 10)
                
                // Item price
                Text(itemPrice)
                    .font(Font.custom("Baskerville", size: 14).weight(.semibold))
                    .foregroundColor(.black)
                    .padding(.top, 2)
            }
            .frame(width: 170, height: 200)
            
            HStack() {
                if isExpanded {
                    // Create a tappable area with 30x30 for the minus/trash icon
                    ZStack {
                        // Invisible tappable area with .contentShape to capture taps
                        Color.clear.frame(width: 30, height: 30)
                            .contentShape(Rectangle())  // Makes the invisible area tappable
                            .onTapGesture {
                                withAnimation(.easeInOut) {
                                    count -= 1
                                    if count == 0 {
                                        isExpanded = false
                                    }
                                }
                            }

                        Image(systemName: count == 1 ? "trash" : "minus")
                            .foregroundColor(Color.white)
                            .padding(.leading, 16)
                    }

                    Spacer()

                    Text("\(count)")
                        .foregroundColor(.white)
                        .font(.system(size: 16))

                    Spacer()
                }

                Image(systemName: "plus")
                    .foregroundColor(Color.white)
                    .padding(.trailing, isExpanded ? 16 : 0)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            count += 1
                            if count > 0 {
                                isExpanded = true
                            }
                        }
                    }
            }
            .frame(width: isExpanded ? 150 : 30, height: 30)
            .background(Color.black)
            .cornerRadius(isExpanded ? 25 : 50)
            .padding(.bottom, 10)
            .padding(.trailing, 10)
            .padding(.leading, 10)
            .animation(.easeInOut(duration: 0.3), value: isExpanded)
        }
        .frame(width: 170, height: 200) // Explicitly set frame to avoid expanding
    }
}

#Preview {
    AddOnItems(
        images: ["Bouquet1","Bouquet1","Bouquet1"], // Add your image names here
        itemName: "Rectangular Acrylic 061",
        itemPrice: "AED 365",
        isCustomizable: true
    )
}
