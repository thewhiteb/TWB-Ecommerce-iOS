//
//  BagItemView.swift
//  TWB-Ecommerce
//
//  Created by Hassam Ali on 19/09/2024.
//

import SwiftUI

struct BagItemView: View {
    @State var item: BagViewItemModel
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Image(.tube018)
                    .resizable()
                    .frame(width: 127, height: 161)
                    .aspectRatio(contentMode: .fit)
                    getItemDetailsView(item: item)
                Spacer()
            }
            .padding(.leading, 15)
            .padding(.top, 12)
            if item.customisedTopper {
                getCustomisedTopperView()
                    .padding([.leading, .trailing], 16)
            }
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
        HStack(alignment: .top) {
            Text(firstText)
                .font(.getFont(name: .libreRegular, size: 12))
                .foregroundColor(Constants.gray)
            Text(secondText)
                .font(.getFont(name: .libreBold, size: 12))
                .foregroundColor(.black)
        }
    }

    @ViewBuilder
    func addDeleteView(item: Binding<BagViewItemModel>) -> some View {
        HStack(spacing: 18){
            Button {
                print("Delete or Minus")
            } label: {
                Image(.delete)
            }
            Text("\(item.wrappedValue.count)")
                .font(.getFont(name: .libreBold, size: 14))
            Button {
                print("Add")
                item.wrappedValue.count += 1
            } label: {
                Image(.add)
            }
        }
        .frame(width: 74, height: 27)
        .padding([.leading, .trailing], 5)
        .border(Constants.black, width: 0.5)
    }

    @ViewBuilder
    func getEditDeleteView() -> some View {
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
    }

    @ViewBuilder
    func getItemDetailsView(item: BagViewItemModel) -> some View {
        VStack(alignment: .leading) {
            HStack {
                Text(item.id)
                    .font(.getFont(name: .libreBold, size: 12))
                .foregroundColor(.black)
                Spacer()
                getEditDeleteView()
            }
            Text("AED \(item.totalPrice)")
                .font(.getFont(name: .libreBold, size: 16))
                .foregroundColor(.black)
            Text("Including VAT")
                .font(.getFont(name: .libreRegular, size: 10))
                .foregroundColor(Constants.gray)
            addDeleteView(item: $item)
                .padding([.top, .bottom], 12)
            if let letters = item.letters {
                horizontalText(firstText: "Letter: ", secondText: letters)
            }
            if let flavour = item.flavour {
                horizontalText(firstText: "Flavour: ", secondText: flavour)
            }
            HStack(alignment: .center) {
                horizontalText(firstText: "Topper: ", secondText: item.topper)
                if item.customisedTopper {
                    Button {
                        print("Arrow clicked")
                    } label: {
                        let image: ImageResource = .upArrow
                        Image(image)
                    }
                }
            }

        }
    }

    @ViewBuilder
    func getCustomisedTopperView() -> some View {
        HStack {
            let text = "There will some text related to Topper"
            Text("\(text)")
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
    BagItemView(item: items[0])
}
