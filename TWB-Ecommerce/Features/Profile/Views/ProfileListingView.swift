//
//  LogoutProfileView.swift
//  TWB-Ecommerce
//
//  Created by Hassam Ali on 24/09/2024.
//

import SwiftUI

struct ProfileListingView: View {
    let items: [ListItem]
    let isUserLoggedIn: Bool = true
    
    private let logoutSections = 3
    private let loginSections = 5
    
    private var sections: Int {
        isUserLoggedIn ? loginSections : logoutSections
    }
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) { // Use LazyVStack with spacing set to 0
                ForEach(items) { item in
                    if isUserLoggedIn {
                        NavigationLink {
                            getDestionationView(for: item)
                        } label: {
                            getListItemRow(for: item)
                                .padding(.leading, 16)
                                .frame(height: 81)
                                .background(Constants.white)
                                .border(Constants.grayBorder, width: 0.5)
                        }
                        .buttonStyle(PlainButtonStyle())  // Removes NavigationLink default styling
                    } else {
                        // Handle logged-out case
                    }
                }
            }
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
    }
}

#Preview {
    ProfileListingView(items: profileItems)
}
