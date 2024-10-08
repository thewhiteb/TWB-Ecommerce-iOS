//
//  DetailFullImageView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 26/09/2024.
//

import SwiftUI

struct DetailFullImageView: View {
    let images: [String]  // List of images
    @State private var currentIndex: Int  // Current selected image index
    @Environment(\.presentationMode) var presentationMode  // To close the view
    @State private var scale: CGFloat = 1.0  // Track zoom level
    
    init(images: [String], selectedIndex: Int) {
        self.images = images
        self._currentIndex = State(initialValue: selectedIndex)
    }
    
    var body: some View {
        ZStack {
            // Background color applied here
            Color(hex: "#F5F5F5")
                .ignoresSafeArea()  // Ensure the background color takes the entire screen
            
            // TabView for swiping between images
            TabView(selection: $currentIndex) {
                ForEach(0..<images.count, id: \.self) { index in
                    Image(images[index])
                        .resizable()
                        .scaledToFit()
                        .tag(index)
                        .scaleEffect(scale)  // Apply zoom scale
                        .gesture(
                            MagnificationGesture()
                                .onChanged { value in
                                    withAnimation(.spring()) {
                                        scale = value
                                    }
                                }
                                .onEnded { _ in
                                    withAnimation(.spring()) {
                                        scale = 1
                                    }
                                }
                        )
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color(hex: "#F5F5F5"))  // Background for each image in full screen
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))  // Disable default indicators
            
            // Custom Page Indicators
            VStack {
                Spacer()
                
                HStack(spacing: 8) {
                    ForEach(0..<images.count, id: \.self) { index in
                        Circle()
                            .fill(index == currentIndex ? Color.black : Color.gray.opacity(0.5))  // Active and inactive indicators
                            .frame(width: 8, height: 8)
                    }
                }
                .padding(.bottom, 120)  // Move indicators up from the close button
            }
            
            // Close button at the bottom
            VStack {
                Spacer()
                Button(action: {
                    presentationMode.wrappedValue.dismiss()  // Close the full-screen view
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.white)
                        .padding(.bottom, 50)
                }
                .shadow(radius: 5)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    DetailFullImageView(images: ["Bouquet1", "Test", "Bouquet1"], selectedIndex: 0)
}
