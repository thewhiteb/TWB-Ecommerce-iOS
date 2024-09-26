//
//  LogoutProfileView.swift
//  TWB-Ecommerce
//
//  Created by Hassam Ali on 24/09/2024.
//

import SwiftUI

struct ProfileListingView: View {
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

    private func getFirstSectionView() -> some View {
        LazyVStack(spacing: 0) {
            NavigationLink {
                
            } label: {
                NavigationRow(image: .notification, text: "Notifications")
            }
        }
    }

    private func getSecondSectionView() -> some View {
        LazyVStack(spacing: 0) {
            NavigationLink {
                
            } label: {
                NavigationRow(image: .order, text: "My Orders")

            }
            Divider()
            NavigationLink {
                
            } label: {
                NavigationRow(image: .personal, text: "Personal Details")
            }
            Divider()
            NavigationLink {
                
            } label: {
                NavigationRow(image: .favourite, text: "My Favourite")
            }
            Divider()
            NavigationLink {
                
            } label: {
                NavigationRow(image: .coupons, text: "Coupons")
            }
            Divider()
            NavigationLink {
                
            } label: {
                NavigationRow(image: .addressBook, text: "Address Book")
            }
            Divider()
            NavigationLink {
                
            } label: {
                NavigationRow(image: .payment, text: "Payment Cards")
            }
        }
    }

    private func getThirdSectionView() -> some View {
        LazyVStack(spacing: 0) {
            NavigationLink {
                
            } label: {
                NavigationRow(image: .setting, text: "Settings")
            }
            Divider()
            NavigationLink {
                
            } label: {
                NavigationRow(image: .support, text: "Need Help? Call or Whatsapp us")
            }
            Divider()
            NavigationLink {
                
            } label: {
                NavigationRow(image: .about, text: "About TWB")
            }
        }
    }

    private func getFourthSectionView() -> some View {
        LazyVStack(spacing: 0) {
            NavigationLink {
                
            } label: {
                NavigationRow(image: .terms, text: "Terms & Condition")
            }
            Divider()
            NavigationLink {
                
            } label: {
                NavigationRow(image: .privacy, text: "Privacy Policy")
            }
        }
    }

    private func getFifthSectionView() -> some View {
        LazyVStack(spacing: 0) {
            NavigationLink {
                
            } label: {
                NavigationRow(image: .logout, text: "Logout")
            }
        }
    }
}

#Preview {
    ProfileListingView(isUserLoggedIn: true)
}
