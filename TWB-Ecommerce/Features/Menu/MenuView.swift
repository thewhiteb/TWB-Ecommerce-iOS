//
//  MenuView.swift
//  TWB-Ecommerce
//
//  Created by Hassam Ali on 26/09/2024.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack {
            getHeaderView()
            ScrollView {
                VStack {
                    VStack {
                        HStack(spacing: 10) {
                            getButton(text: "Flowers", isSelected: true) {
                                print("Flowers Clicked")
                            }
                            getButton(text: "Catering", isSelected: false) {
                                print("Catering Clicked")
                            }
                            getButton(text: "Events", isSelected: false) {
                                print("Events Clicked")
                            }
                        }
                        .padding(.top, 16)
                        VStack(spacing: 12) {
                            getCart(text: "Shop by Style", image: .style)
                            getCart(text: "Gift by Occasion", image: .occasion)
                            getCart(text: "Corporate Gifting", image: .gifting)
                        }
                        .padding(.top, 30)
                    }
                    .background(Constants.white)
                    .padding([.leading, .trailing], 16)
                    VStack {
                        VStack {
                            HStack {
                                Text("Trending Product")
                                    .font(.getFont(name: .libreBold, size: 17))
                                    .foregroundStyle(Constants.black)
                                Spacer()
                            }
                            .padding([.top, .bottom], 30)
                            .padding(.leading, 16)
                            TrendingProductList(trendingProductList: HomeScreenDataSingleton.shared.trendingProducts ?? [])
                                .padding(.leading, 16)
                        }
                        .background(Constants.white)
                        .padding([.top, .bottom])
                        getNavigationRows()
                        SocialMediaLinks()
                            .padding([.top, .bottom], 30)
                    }
                    .background(Constants.lightGray2)
                }
            }
            .scrollIndicators(.hidden)
            Spacer()
        }
        .safeAreaInset(edge: .top) {
            Color.clear.frame(height: 50)
        }
    }

    private func getHeaderView() -> some View {
        VStack {
            Text("Menu")
                .font(.getFont(name: .libreBold, size: 16))
                .foregroundStyle(Constants.black)
                .padding(.bottom, 16)
                .padding(.top, 10)
            Divider()
        }
    }

    private func getButton(text: String,
                           isSelected: Bool,
                           action: @escaping () -> Void) -> some View {
        let backgroundColor: Color = isSelected ? Constants.black : Constants.lightGray
        let foregroundColor: Color = isSelected ? Constants.white : Constants.gray
        let font: Font = isSelected ? .getFont(name: .libreBold) : .getFont(name: .libreRegular)
        let button = Button {
            action()
        } label: {
            Text(text)
                .frame(width: 125, height: 50)
                .background(backgroundColor)
                .foregroundStyle(foregroundColor)
                .font(font)
        }
        return button
    }

    private func getCart(text: String,
                         image: ImageResource) -> some View {
        HStack {
            Text(text)
                .padding(.leading, 16)
                .font(.getFont(name: .libreBold))
                .foregroundStyle(Constants.black)
            Spacer()
            Image(image)
                .padding(.trailing, 30)
        }
        .frame(height: 121)
        .background(Constants.creamColor)
    }

    private func getNavigationRows() -> some View {
        LazyVStack(spacing: 0) {
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
}

#Preview {
    MenuView()
}
