//
//  SocialMediaLinks.swift
//  TWB-Ecommerce
//
//  Created by Hassam Ali on 26/09/2024.
//

import SwiftUI

struct SocialMediaLinks: View {
    var body: some View {
        VStack(spacing: 17) {
            HStack(spacing: 6) {
                Button {
                    print("Facebook Clicked")
                } label: {
                    Image(.facebook)
                }
                Button {
                    print("Instagram Clicked")
                } label: {
                    Image(.instagram)
                }
                Button {
                    print("Tiktok Clicked")
                } label: {
                    Image(.tiktok)
                }
                Button {
                    print("Snapchat Clicked")
                } label: {
                    Image(.snapchat)
                }
            }
            Text("Follow us on")
                .font(.getFont(name: .libreRegular, size: 10))
                .foregroundStyle(Constants.black)
        }
    }
}

#Preview {
    SocialMediaLinks()
}
