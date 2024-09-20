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
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15 * scale) {  // Dynamically adjust spacing based on scale
                    ForEach(listTabItems, id: \.imageText) { item in
                        TabListItem(listTabItem: item, scale: scale)  // Pass scale to TabListItem

                    }
                }
                .padding(.horizontal, 10)  // Adjust padding dynamically
            }
        }
        .background(Color.white)
    }
}

//// Preview with sample data
struct TabListItemScrollView_Previews: PreviewProvider {
    static var previews: some View {
        TabListView(scale: 1.0)
    }
}


