//
//  FiltersSheet.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 24/09/2024.
//


import SwiftUI

struct FiltersSheet: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedFilters: [String] = []  // Track selected filters
    @State private var selectedPrice: String? = nil  // Track selected price
    @State private var selectedColor: String? = nil  // Track the selected single color
    @State private var showShadow: Bool = false  // Control shadow visibility
    
    var body: some View {
        VStack(spacing: 0) {
            // Sticky header
            VStack(spacing: 0) {
                HStack {
                    Text("Filters ")
                        .font(.custom("Baskerville", size: 18))
                        .fontWeight(.semibold)
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
                
                // Horizontal scrollable selected filters with cross icon
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(selectedFilters + (selectedColor != nil ? [selectedColor!] : []) + (selectedPrice != nil ? [selectedPrice!] : []), id: \.self) { filter in
                            HStack(spacing: 5) {
                                Text(filter)
                                    .font(.custom("Baskerville", size: 12))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                
                                // Cross icon to remove the filter
                                Button(action: {
                                    withAnimation(.easeInOut) {
                                        removeFilter(filter) // Remove filter with animation
                                    }
                                }) {
                                    Image(systemName: "xmark")
                                        .resizable()
                                        .foregroundColor(.gray)
                                        .frame(width: 10, height: 10)
                                }
                                .padding(.leading, 5)
                            }
                            .padding(10)
                            .background(Color.black)
                            .transition(.move(edge: .leading).combined(with: .opacity))
                        }
                    }
                }
                .padding()
                .animation(.easeInOut, value: selectedFilters)
                
                Divider()
                    .background(Color.gray.opacity(0.3))
            }
            .background(Color.white)
            .shadow(color: Color.black.opacity(showShadow ? 0.3 : 0), radius: 3, x: 0, y: 3)  // Shadow that appears when scrolling
            .animation(.easeInOut, value: showShadow)  // Animate shadow appearance
            
            ScrollView {
                VStack {
                    GeometryReader { geo in
                        Color.clear
                            .onChange(of: geo.frame(in: .global).minY) { value in
                                // Show shadow when scrolling up
                                showShadow = value < 0
                            }
                    }
                    .frame(height: 0)  // Hidden GeometryReader to track scroll position
                    
                    // Pass the selected filters to the OccasionDropdownView
                    OccasionDropdownView(selectedOccasionNames: $selectedFilters)
                    
                    Divider()
                        .background(Color.gray.opacity(0.3))
                    
                    // Pass the selected color to the ColorDropdownView
                    ColorDropdownView(selectedColor: $selectedColor, title: "Colors", isCollapsible: true)
                    
                    Divider()
                        .background(Color.gray.opacity(0.3))
                    
                    // Pass the selected filters to the FlowersDropdownView
                    FlowersDropDownView(selectedFlowerNames: $selectedFilters)
                    
                    Divider()
                        .background(Color.gray.opacity(0.3))
                    
                    // Pass the selected price to the PriceDropDownView
                    PriceDropDownView(selectedPriceName: $selectedPrice)
                }
            }
            
            Spacer()
            
            // Make the buttons sticky at the bottom
            HStack(spacing: 10) {
                SimpleButtonWhite(action: {
                    // Clear filters action
                    selectedFilters.removeAll()
                    selectedColor = nil
                    selectedPrice = nil
                }, text: "Clear Filters")
                
                SimpleButtonBlack(action: {
                    // See results action
                }, text: "See Results")
            }
            .padding()
            .background(Color.white)  // Background for the buttons
            .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 1)  // Add shadow to the bottom buttons
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)  // Ignore keyboard safe area if needed
    }
    
    // Function to remove a filter from the list and unselect it in the dropdown views
    private func removeFilter(_ filter: String) {
        if let index = selectedFilters.firstIndex(of: filter) {
            selectedFilters.remove(at: index)  // Remove the filter from occasions or flowers
        } else if selectedColor == filter {
            selectedColor = nil  // Remove the selected color
        } else if filter == selectedPrice {
            selectedPrice = nil  // Deselect the price
        }
    }
}

#Preview {
    FiltersSheet()
}
