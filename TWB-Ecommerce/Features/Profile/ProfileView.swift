//
//  ProfileView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 09/09/2024.
//


import SwiftUI

struct ProfileView: View {
    let isUserLoggedIn: Bool = true

    let items: [ListItem] = [.init(id: "Notifications",
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

    var body: some View {
        VStack {
            profileView(isLoggedIn: isUserLoggedIn)
        }
        .safeAreaInset(edge: .top) {
            Color.clear.frame(height: 50)
        }
        .background(Constants.lightGray)
    }

    @ViewBuilder
    func loginView() -> some View {
        NavigationView {
            VStack {
                logoutProfileView()
            }
        }
    }

    @ViewBuilder
    func profileView(isLoggedIn: Bool = false) -> some View {
        if isLoggedIn {
            loginProfileView()
        } else {
            logoutProfileView()
        }
    }

    @ViewBuilder
    func logoutProfileView() -> some View {
        let items = items.filter { item in
            item.logoutItem == true
        }
        LogoutProfileView(onLoginButtonClicked: {
            print("Login Button Clicked")
        }, onSignupButtonClicked: {
            print("Sign up button Clicked")
        }, items: items)
    }

    @ViewBuilder
    func loginProfileView() -> some View {
        LoginProfileView()
    }
}
#Preview {
    ProfileView()
}
