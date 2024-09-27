//
//  TabListView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 18/09/2024.
//

import SwiftUI

struct TabListView: View {
    let scale: CGFloat  // Add a scale parameter to dynamically scale the items

    let listTabItems = [
        ListTabItem(imageName: "tube_acrylic", imageText: "Tube Acrylic"),
        ListTabItem(imageName: "single_acrylic", imageText: "Single Acrylic"),
        ListTabItem(imageName: "rectangle_acrylic", imageText: "Rectangular Acrylic"),
        ListTabItem(imageName: "tube_acrylic", imageText: "Circle Acrylic"),
        ListTabItem(imageName: "tube_acrylic", imageText: "Letter")
    ]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(listTabItems, id: \.imageText) { item in
                    TabListItem(listTabItem: item)
                        .scaleEffect(scale)  // Apply the scale effect to each item
                        .animation(.easeOut, value: scale)
                }
            }
            .padding(.horizontal, 10)
        }
        .frame(height: 160 * scale)   // Adjust the height based on the scale
        .background(Color.white)
    }
}

//// Preview with sample data
struct TabListItemScrollView_Previews: PreviewProvider {
   
    static var previews: some View {
        TabListView(scale: 1.0)
    }
}

