//
//  TabListItem.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 18/09/2024.
//

import SwiftUI

struct TabListItem: View {
    let listTabItem : ListTabItem
    
    var body: some View {
        
        VStack{
            
            ZStack {
                
                Rectangle()
                    .fill(Color(red: 0.83, green: 0.87, blue: 0.9).opacity(0.3))
                    .frame(width: 118, height: 124)
                
                // Centered image
                Image(listTabItem.imageName)
                    .resizable()
                    .scaledToFit()
                    .padding(10)
                
            }
            .frame(width: 118, height: 124)
            
            Text(listTabItem.imageText.uppercased())
                .font(
                    Font.custom("Lato", size: 10))
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.top,10)
        }
        
    }
}


struct TabListItem_Previews: PreviewProvider {
    static var previews: some View {
        let tabListItem = ListTabItem(imageName: "tube_acrylic", imageText: "Tube Acrylic")
        
        TabListItem(listTabItem: tabListItem)
            .previewLayout(.sizeThatFits) // Ensures the view will fit the preview
    }
}
