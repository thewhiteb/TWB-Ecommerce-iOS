//
//  TabListSmallView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 19/09/2024.
//

import SwiftUI


struct TabListSmallView: View {
    
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
                    TabListSmallItem(listTabItem: item)
                }
            }
            .padding(.horizontal, 10)
        }
        .frame(height: 50) // Adjust height for the scroll view
        .background(Color.white)
    }
}

// Preview with sample data
struct TabListSmallView_Previews: PreviewProvider {
    static var previews: some View {
        TabListSmallView()
    }
}
