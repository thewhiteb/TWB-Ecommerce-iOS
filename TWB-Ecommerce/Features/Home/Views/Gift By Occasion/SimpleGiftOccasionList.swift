//
//  SimpleGiftOccasionList.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 10/09/2024.
//

import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct SimpleGiftOccasionList: View {
    
    @State private var scrollOffset: CGFloat = 0.25  // Start progress at 25%
    @State private var maxScrollWidth: CGFloat = 0  // To store the scrollable width
    @State private var contentWidth: CGFloat = 0    // To store the total content width
    
    // Sample list of items
    @State var items: [ProductItem]
    
    var body: some View {
        VStack{
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack() {
                    // Use FirstItemView for the first item
                    if let firstItem = items.first {
                        FirstItemView(item: firstItem)
                    }
                    
                    // Use ItemView for the remaining items
                    ForEach(items.dropFirst()) { item in
                        ItemView(item: item)
                    }
                }
                
                .background(
                    GeometryReader { outerGeometry in
                        Color.clear
                            .onAppear {
                                maxScrollWidth = outerGeometry.size.width
                            }
                            .onChange(of: outerGeometry.frame(in: .global).minX) { value in
                                // Update the scroll offset based on the current scroll position
                                let newOffset = -value / (maxScrollWidth - UIScreen.main.bounds.width)
                                let scaledOffset = newOffset * 0.75 + 0.25  // Scale to start at 25%
                                scrollOffset = min(max(scaledOffset, 0.25), 1)  // Clamp between 0.25 and 1
                            }
                    })
            }
            .frame(height: 250) // Adjusted height to fit the content
            
            // Custom progress bar with a very thin height
            ProgressView(value: scrollOffset, total: 1)
                .progressViewStyle(LinearProgressViewStyle(tint: Color.black))
                .frame(height: 1)  // Use `1` for a thin, visible progress bar
                .scaleEffect(x: 1, y: 0.5, anchor: .center)  // Scale down the height
                .padding(.top, 20)
                .padding(.trailing,10)
        }
       
    }
}

// Separate view for the first item
struct FirstItemView: View {
    var item: ProductItem
    
    var body: some View {
        ZStack {
            HStack {
                Text("Class of\n2024")
                    .font(Font.custom("Baskerville", size: 24))
                    .foregroundColor(.black)
                    .padding(30)
                
                Spacer()
                
            }

            let url = Constants.imagesBaseURL + (item.storyImageKey ?? "")
            WebImage(url: URL(string: url)) { image in
                image.resizable() // Control layout like SwiftUI.AsyncImage, you must use this modifier or the view will use the image bitmap size
            } placeholder: {
                ImagePlaceholderView()
            }
            .indicator(.activity) // Activity Indicator
            .transition(.fade(duration: 0.5)) // Fade Transition with duration
            .scaledToFit()
            .frame(width: 200, height: 200) // Larger image but within the frame limit
            .clipped()// Ensures that the image stays within its frame
            .offset(x:50)
            
        }
        .frame(width: 287, height: 250) // Larger frame for first item
        .background(Color(red: 0.85, green: 0.85, blue: 0.85)) // Different background color for first item
        
    }
}

// Separate ItemView struct to handle individual item display
struct ItemView: View {
    var item: ProductItem
    
    var body: some View {
        ZStack {
            VStack {
                Text(item.name ?? "")
                    .font(Font.custom("Baskerville", size: 14))
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .frame(width: 120, alignment: .top) // Standard width
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .padding(.top, 20)
                
                Spacer()
                
                let url = Constants.imagesBaseURL + (item.storyImageKey ?? "")
                WebImage(url: URL(string: url)) { image in
                    image.resizable() // Control layout like SwiftUI.AsyncImage, you must use this modifier or the view will use the image bitmap size
                } placeholder: {
                    ImagePlaceholderView()
                }
                .indicator(.activity) // Activity Indicator
                .transition(.fade(duration: 0.5)) // Fade Transition with duration
                .scaledToFit()
                .frame(height: 180) // Standard image height
            }
        }
        .frame(width: 142, height: 250) // Standard frame for remaining items
        .background(Color(red: 0.85, green: 0.85, blue: 0.85))
    }
}


#Preview {
    SimpleGiftOccasionList(items: [])
}

