//
//  TabListItem.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 18/09/2024.
//

import SwiftUI

struct TabListItem: View {
    let listTabItem: ListTabItem
    let scale: CGFloat  // Add a scale parameter to dynamically adjust size

    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(Color(red: 0.83, green: 0.87, blue: 0.9).opacity(0.3))
                    .frame(width: 118 , height: 124 * scale)  // Adjust size dynamically
                
                // Centered image
                Image(listTabItem.imageName)
                    .resizable()
                    .scaledToFit()
                    .padding(10 * scale)  // Adjust padding dynamically
            }
            .frame(width: 118 , height: 124 * scale)  // Adjust size dynamically

            Text(listTabItem.imageText.uppercased())
                .font(Font.custom("Lato", size: 10))  // Adjust font size dynamically
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.top, 10)  // Adjust top padding dynamically
        }
    }
}

struct TabListItem_Previews: PreviewProvider {
    static var previews: some View {
        let tabListItem = ListTabItem(imageName: "tube_acrylic", imageText: "Tube Acrylic")
        
        TabListItem(listTabItem: tabListItem, scale: 1.0)  // Provide a scale for preview
            .previewLayout(.sizeThatFits) // Ensures the view will fit the preview
    }
}
