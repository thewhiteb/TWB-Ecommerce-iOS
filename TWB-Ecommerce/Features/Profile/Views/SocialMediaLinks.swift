//
//  SocialMediaLinks.swift
//  TWB-Ecommerce
//
//  Created by Hassam Ali on 26/09/2024.
//

import SwiftUI

struct SocialMediaLinks: View {
    @Environment(\.openURL) var openLink
    var body: some View {
        VStack(spacing: 17) {
            HStack(spacing: 6) {
                Button {
                    openURL(using: Constants.SocialMedia.facebookString)
                } label: {
                    Image(.facebook)
                }
                Button {
                    openURL(using: Constants.SocialMedia.instagramString)
                } label: {
                    Image(.instagram)
                }
                Button {
                    openURL(using: Constants.SocialMedia.tikTokString)
                } label: {
                    Image(.tiktok)
                }
                Button {
                    openURL(using: Constants.SocialMedia.snapChatString)
                } label: {
                    Image(.snapchat)
                }
            }
            Text("Follow us on")
                .font(.getFont(name: .libreRegular, size: 10))
                .foregroundStyle(Constants.black)
        }
    }

    private func openURL(using str: String) {
        if let url = URL(string: str) {
            openLink(url)
        } else {
            // Log not fatel Exception
        }
    }
}

#Preview {
    SocialMediaLinks()
}
