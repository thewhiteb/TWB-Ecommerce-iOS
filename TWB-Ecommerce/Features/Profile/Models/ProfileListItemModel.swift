//
//  ProfileListItemModel.swift
//  TWB-Ecommerce
//
//  Created by Hassam Ali on 24/09/2024.
//

import SwiftUI

struct ListItem: Hashable, Equatable, Identifiable {
    let id: String
    let icon: ImageResource
    let logoutItem: Bool
}


let profileItems: [ListItem] = [.init(id: "Notifications",
                               icon: .notification,
                               logoutItem: true),
                         .init(id: "My Orders",
                               icon: .order,
                               logoutItem: false),
                         .init(id: "Personal Details",
                               icon: .personal,
                               logoutItem: false),
                         .init(id: "My Favourite",
                               icon: .favourite,
                               logoutItem: false),
                         .init(id: "Coupons",
                               icon: .coupons,
                               logoutItem: false),
                         .init(id: "Address Book",
                               icon: .addressBook,
                               logoutItem: false),
                         .init(id: "Payment Cards",
                               icon: .payment,
                               logoutItem: false),
                         .init(id: "Settings",
                               icon: .setting,
                               logoutItem: true),
                         .init(id: "Need Help? Call or Whatsapp us",
                               icon: .support,
                               logoutItem: true),
                         .init(id: "About TWB",
                               icon: .about,
                               logoutItem: true),
                         .init(id: "Terms & Condition",
                               icon: .terms,
                               logoutItem: true),
                         .init(id: "Privacy Policy",
                               icon: .privacy,
                               logoutItem: true),
                         .init(id: "LOGOUT",
                               icon: .logout,
                               logoutItem: false)
]
