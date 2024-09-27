//
//  NavigationRow.swift
//  TWB-Ecommerce
//
//  Created by Hassam Ali on 26/09/2024.
//

import SwiftUI

struct NavigationRow: View {
    let image: ImageResource
    let text: String

    var body: some View {
        HStack(alignment: .center) {
            Image(image)
            Text(text)
                .font(.getFont(name: .libreRegular, size: 12))
                .foregroundStyle(Constants.black)
            Spacer()
            Image(.nextArrow)
        }
        .padding(.leading, 16)
        .frame(height: 81)
        .background(Constants.white)
    }
}

#Preview {
    NavigationRow(image: .about, text: "About")
}
