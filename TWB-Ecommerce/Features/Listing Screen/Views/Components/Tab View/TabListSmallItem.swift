//
//  TabListSmallItem.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 19/09/2024.
//

import SwiftUI

struct TabListSmallItem: View {
    let listTabItem : ListTabItem
    
    var body: some View {
        
        VStack{
            
            ZStack {
                
                Rectangle()
                    .fill(Color(red: 0.83, green: 0.87, blue: 0.9).opacity(0.3))
                    .frame( height: 38)
                
                Text(listTabItem.imageText.uppercased())
                    .font(
                        Font.custom("Lato", size: 10))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.horizontal,10)
                
            }
            .frame(height: 38)
            
           
        }
        
    }
}


struct TabListSmallItem_Previews: PreviewProvider {
    static var previews: some View {
        let tabListItem = ListTabItem(imageName: "tube_acrylic", imageText: "Tube Acrylic")
        
        TabListSmallItem(listTabItem: tabListItem)
            .previewLayout(.sizeThatFits) // Ensures the view will fit the preview
    }
}
