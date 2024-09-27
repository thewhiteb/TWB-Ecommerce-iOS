//
//  ProfileView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 09/09/2024.
//


import SwiftUI

struct ProfileView: View {
    let isUserLoggedIn: Bool = true

    var body: some View {
        VStack {
            getHeaderView()
                .padding([.leading, .trailing], 16)
                .padding(.top, isUserLoggedIn ? 10 : 30)
            ProfileListingView(isUserLoggedIn: isUserLoggedIn)
        }
        .safeAreaInset(edge: .top) {
            Color.clear.frame(height: 50)
        }
        .background(Constants.lightGray)
    }

    @ViewBuilder
    private func getHeaderView() -> some View {
        if isUserLoggedIn {
            HStack {
                Spacer()
                Text("Hi Hassam")
                    .font(.getFont(name: .libreBold,
                                   size: 16))
                    .foregroundStyle(Constants.black)
                Spacer()
            }
            .padding(.bottom, 10)
        } else {
            VStack(alignment: .leading) {
                getColoredText()
                getButtons()
                    .padding(.top, 30)
            }
            .padding(.bottom, 30)
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
    ProfileView()
}


//struct MenuView: View {
//    enum MenuItem: String {
//        case staff = "Staff"
//        case projects = "Projects"
//        case invoices = "Invoices"
//        case about = "About"
//        case feedback = "Fourth"
//
//        static let infoSection: [MenuItem] = [.staff, .projects, .invoices]
//        static let helpSection: [MenuItem] = [.about, .feedback]
//    }
//
//    var body: some View {
//        NavigationView {
//            List {
//                makeSection(title: "Info", items: MenuItem.infoSection)
//                makeSection(title: "Help", items: MenuItem.helpSection)
//            }
//            .navigationBarTitle("Menu")
//        }
//    }
//
//    private func makeSection(title: String, items: [MenuItem]) -> some View {
//        Section(header: Text(title)) {
//            ForEach(items, id: \.self) { item in
//                NavigationLink(destination: self.destination(forItem: item)) {
//                    Text(item.rawValue)
//                }
//            }
//        }
//    }
//
//    private func destination(forItem item: MenuItem) -> some View {
//        switch item {
//            case .staff: return AnyView(Text("Staff View"))
//            case .projects: return AnyView(Text("Projects View"))
//            case .invoices: return AnyView(Text("Invoices View"))
//            case .about: return AnyView(Text("About View"))
//            case .feedback: return AnyView(Text("Feedback View"))
//        }
//    }
//}
