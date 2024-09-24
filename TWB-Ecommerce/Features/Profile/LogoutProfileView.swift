//
//  LogoutProfileView.swift
//  TWB-Ecommerce
//
//  Created by Hassam Ali on 24/09/2024.
//

import SwiftUI

protocol LoginSignUpViews {
    
}
extension LoginSignUpViews {
    @ViewBuilder
    func getRowsFor(items: [ListItem]) -> some View {
        VStack {
            ForEach(items) { item in
                HStack {
                    Image(item.icon)
                    Text(item.id)
                    Spacer()
                    Image(.nextArrow)
                }
            }
        }
    }
}

struct ListItem: Hashable, Equatable, Identifiable {
    let id: String
    let icon: ImageResource
    let logoutItem: Bool
}

struct LogoutProfileView: View, LoginSignUpViews {
    let onLoginButtonClicked: () -> Void
    let onSignupButtonClicked: () -> Void
    let items: [ListItem]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                getColoredText()
                getButtons()
                    .padding(.top, 30)
                getRowsFor(items: items)
            }
            .padding([.leading, .trailing], 16)
        }
    }

    private func getColoredText() -> Text {
        "Sign in for a personalized \ngifting experience."
            .colorWord("personalized",
                       wordColor: Constants.cherry,
                       defaultColor: Constants.black)
            .font(.getFont(name: .libreBold, size: 20))
    }

    @ViewBuilder
    private func getButtons() -> some View {
        HStack(spacing: 10) {
            Button {
                print("Login Button Clicked")
            } label: {
                Text("Login")
                    .font(.getFont(name: .libreBold, size: 14))
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .border(Constants.black, width: 1)
                    .foregroundColor(Constants.black)
                    .background(Constants.clear)
            }

            Button {
                print("Signup Button Clicked")
            } label: {
                Text("Sign up")
                    .font(.getFont(name: .libreBold, size: 14))
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .foregroundColor(Constants.white)
                    .background(Constants.black)
            }
        }
    }
}

#Preview {
//    LogoutProfileView(onLoginButtonClicked: {
//        print(" Login Button Clicked ")
//    }, onSignupButtonClicked: {
//        print(" Signup Button Clicked ")
//    })
    ProfileView()
}
