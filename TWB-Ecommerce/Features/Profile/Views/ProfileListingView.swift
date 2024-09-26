//
//  LogoutProfileView.swift
//  TWB-Ecommerce
//
//  Created by Hassam Ali on 24/09/2024.
//

import SwiftUI

struct ProfileListingView: View {
    let items: [ListItem]
    let isUserLoggedIn: Bool
    
    private let logoutSections = 3
    private let loginSections = 5
    
    private var sections: Int {
        isUserLoggedIn ? loginSections : logoutSections
    }
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) { // Use LazyVStack with spacing set to 0
                getFirstSectionView()
                    .padding(.bottom, 10)
                if isUserLoggedIn {
                    getSecondSectionView()
                        .padding(.bottom, 10)
                }
                getThirdSectionView()
                    .padding(.bottom, 10)
                getFourthSectionView()
                    .padding(.bottom, 10)
                if isUserLoggedIn {
                    getFifthSectionView()
                        .padding(.bottom, 10)
                }
            }
            SocialMediaLinks()
                .padding([.top, .bottom], 30)
        }
        .scrollIndicators(.hidden)
    }
    
    private func getDestionationView(for item: ListItem) -> some View {
        Rectangle()
            .background(.red)
    }
    
    private func getListItemRow(for item: ListItem) -> some View {
        HStack(alignment: .center) {
            Image(item.icon)
            Text(item.id)
                .font(.getFont(name: .libreRegular, size: 12))
                .foregroundStyle(Constants.black)
            Spacer()
            Image(.nextArrow)
        }
        .padding(.leading, 16)
        .frame(height: 81)
        .background(Constants.white)
    }

    private func getFirstSectionView() -> some View {
        LazyVStack(spacing: 0) {
            NavigationLink {
                
            } label: {
                let item: ListItem = .init(id: "Notifications",
                                           icon: .notification)
                getListItemRow(for: item)
            }
        }
    }

    private func getSecondSectionView() -> some View {
        LazyVStack(spacing: 0) {
            NavigationLink {
                
            } label: {
                let item: ListItem = .init(id: "My Orders",
                                           icon: .order)
                getListItemRow(for: item)

            }
            Divider()
            NavigationLink {
                
            } label: {
                let item: ListItem = .init(id: "Personal Details",
                                           icon: .personal)
                getListItemRow(for: item)
            }
            Divider()
            NavigationLink {
                
            } label: {
                let item: ListItem = .init(id: "My Favourite",
                                           icon: .favourite)
                getListItemRow(for: item)
            }
            Divider()
            NavigationLink {
                
            } label: {
                let item: ListItem =  .init(id: "Coupons",
                                            icon: .coupons)
                getListItemRow(for: item)
            }
            Divider()
            NavigationLink {
                
            } label: {
                let item: ListItem = .init(id: "Address Book",
                                           icon: .addressBook)
                getListItemRow(for: item)
            }
            Divider()
            NavigationLink {
                
            } label: {
                let item: ListItem = .init(id: "Payment Cards",
                                           icon: .payment)
                getListItemRow(for: item)
            }
        }
    }

    private func getThirdSectionView() -> some View {
        LazyVStack(spacing: 0) {
            NavigationLink {
                
            } label: {
                let item: ListItem = .init(id: "Settings",
                                            icon: .setting)
                getListItemRow(for: item)
            }
            Divider()
            NavigationLink {
                
            } label: {
                let item: ListItem = .init(id: "Need Help? Call or Whatsapp us",
                                           icon: .support)
                getListItemRow(for: item)
            }
            Divider()
            NavigationLink {
                
            } label: {
                let item: ListItem = .init(id: "About TWB",
                                           icon: .about)
                getListItemRow(for: item)
            }
        }
    }

    private func getFourthSectionView() -> some View {
        LazyVStack(spacing: 0) {
            NavigationLink {
                
            } label: {
                let item: ListItem = .init(id: "Terms & Condition",
                                           icon: .terms)
                getListItemRow(for: item)
            }
            Divider()
            NavigationLink {
                
            } label: {
                let item: ListItem = .init(id: "Privacy Policy",
                                           icon: .privacy)
                getListItemRow(for: item)
            }
        }
    }

    private func getFifthSectionView() -> some View {
        LazyVStack(spacing: 0) {
            NavigationLink {
                
            } label: {
                let item: ListItem = .init(id: "Logout",
                                          icon: .logout)
                getListItemRow(for: item)
            }
        }
    }
}

#Preview {
    ProfileListingView(items: profileItems, isUserLoggedIn: true)
}
