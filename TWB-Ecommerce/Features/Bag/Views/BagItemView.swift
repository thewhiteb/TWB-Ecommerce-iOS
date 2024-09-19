//
//  BagItemView.swift
//  TWB-Ecommerce
//
//  Created by Hassam Ali on 19/09/2024.
//

import SwiftUI

struct BagItemView: View {
    @State var ietm: BagViewItemModel
    var body: some View {
        VStack {
            HStack {
                Image(.tube018)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 127, height: 161)
                ZStack(alignment: .leading) {
                    getItemDetailsView()
                        .padding(.top, 12)
                    getEditeDeleteView()
                        .padding(.top, 14)
                        .padding(.trailing, 12)
                }
                .padding(.leading, 12)
                Spacer()
            }
            .padding(.leading, 15)
            getCustomisedTopperView()
            .padding([.leading, .trailing], 16)
            Divider()
                .padding(.top, 16)
            getTotalValueView()
            .padding([.bottom, .top], 16)
        }
        .background(.white)
    }

    @ViewBuilder
    func horizontalText(firstText: String,
                        secondText: String) -> some View {
        HStack {
            Text(firstText)
                .font(.getFont(name: .libreRegular, size: 12))
                .foregroundColor(Constants.gray)
            Text(secondText)
                .font(.getFont(name: .libreBold, size: 12))
                .foregroundColor(.black)
        }
    }

    @ViewBuilder
    func addDeleteView() -> some View {
        HStack(spacing: 18){
            Button {
                print("Delete or Minus")
            } label: {
                Image(.delete)
            }
            Text("1")
            Button {
                print("Add")
            } label: {
                Image(.add)
            }
        }
        .padding([.leading, .trailing], 5)
        .border(.black)
    }

    @ViewBuilder
    func getEditeDeleteView() -> some View {
        HStack {
            Spacer()
            VStack {
                HStack {
                    Button {
                        print("Edit")
                    } label: {
                        Image(.edit)
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                    Image(.line)
                    Button {
                        print("delete")
                    } label: {
                        Image(.close)
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                }
                Spacer()
            }
        }
    }

    @ViewBuilder
    func getItemDetailsView() -> some View {
        VStack(alignment: .leading) {
            Text("Tube Acrylic 018")
                .font(.getFont(name: .libreBold, size: 12))
                .foregroundColor(.black)
            Text("AED 447")
                .font(.getFont(name: .libreBold, size: 16))
                .foregroundColor(.black)
            Text("Including VAT")
                .font(.getFont(name: .libreRegular, size: 10))
                .foregroundColor(Constants.gray)
            addDeleteView()
                .padding([.top, .bottom], 16)
            horizontalText(firstText: "Letter: ", secondText: "A")
            horizontalText(firstText: "Flavour: ", secondText: "Vanilla Mistikkah")
            HStack(alignment: .center) {
                horizontalText(firstText: "Topper: ", secondText: "Congratulations (AED 32)")
                Button {
                    
                } label: {
                    let image: ImageResource = .upArrow
                    Image(image)
                        .resizable()
                        .frame(width: 10, height: 6)
                }
            }

        }
    }

    @ViewBuilder
    func getCustomisedTopperView() -> some View {
        HStack {
            let text = "There will some text related to Topper"
            Text("Text: \(text)")
                .font(.getFont(name: .libreRegular, size: 12))
                .foregroundStyle(Constants.gray)
                .padding([.top, .bottom], 20)
                .padding(.leading, 17)
                .lineLimit(2)
            Spacer()
            Text("3 Working Days")
                .font(.getFont(name: .latoBold, size: 10))
                .foregroundStyle(Constants.cherry)
                .padding([.leading, .trailing], 5)
                .padding([.top, .bottom], 2)
                .background(Constants.cherry.opacity(0.07))
                .padding([.top, .bottom], 20)
                .padding(.trailing, 17)
        }
        .background(Constants.lightGray)
    }

    @ViewBuilder
    func getTotalValueView() -> some View {
        HStack {
            HStack {
                Button {
                    print("Move to wish list")
                } label: {
                    Image(.heart)
                        .resizable()
                        .frame(width: 17, height: 17)
                }
                Text("Move to Wishlist")
                    .font(.getFont(name: .libreRegular, size: 10))
                    .foregroundStyle(.black)
            }
            .padding(.leading, 15)
            Spacer()
            HStack {
                Text("Total")
                    .font(.getFont(name: .libreRegular, size: 12))
                    .foregroundStyle(Constants.gray)
                Image(.line)
                    .resizable()
                    .frame(width: 1, height: 13)
                let price = 479
                Text("AED \(price)")
                    .font(.getFont(name: .libreBold, size: 12))
            }
            .padding(.trailing, 16)
        }
    }
}

#Preview {
    BagItemView(ietm: items[0])
}
