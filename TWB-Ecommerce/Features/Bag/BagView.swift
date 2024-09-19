//
//  BagView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 09/09/2024.
//


import SwiftUI

struct BagView: View {
    @State var count: Int
    var body: some View {
        VStack {
            getTitleView(count: count)
            Spacer()
            if count == 0 {
                EmptyBagView()
                Spacer()
            } else {
                VStack {
                    BagListingView(items: items)
                        .padding(.top, 10)
                }
                .background(Constants.lightGray)
            }
        }
        .safeAreaInset(edge: .top) {
            Color.clear.frame(height: 50)
        }
    }

    @ViewBuilder
    func getTitleView(count: Int) -> some View {
        HStack {
            Text("My Bag (\(count))")
        }
    }

}

struct EmptyBagView: View {
    var body: some View {
        getMiddleView()
    }

    @ViewBuilder
    func getMiddleView() -> some View {
        VStack {
            Image(.emptyBag)
            Text("Your Shopping Bag Is Currently Empty!")
                .font(.getFont(name: .libreRegular, size: 20))
                .multilineTextAlignment(.center)
                .frame(width: 232)
                .padding()

            Button("Start Shopping") {
                print("Going to home screen")
            }
            .padding([.top, .bottom])
            .padding([.leading, .trailing], 20)
            .background(Color.black)
            .foregroundColor(.white)
            .font(.getFont(name: .libreRegular, size: 14))
            .frame(width: 175)
        }
    }
}

struct BagListingView: View {
    let items: [BagViewItemModel]
    var body: some View {
        ScrollView {
            ForEach(items) { item in
                LazyVStack(alignment: .leading, spacing: 10, content: {
                    BagItemView(ietm: item)
                })
            }
        }
    }
}

struct BagViewItemModel: Equatable, Hashable, Identifiable {
    let id: String
    let price: Float
    var count: Int
    let letters: String?
    let flavour: String?
    let topper: String
    let customisedTopper: Bool
    let vat: Float // Question: is it for a single product or for all product. Like count is 2, then for 2 or for 1
    let imageURL: String
    var totalPrice: Float {
        (Float(count) * price) + vat
    }
}

let items: [BagViewItemModel] = [.init(id: "Tube Acrylic 018",
                                       price: 447,
                                       count: 1,
                                       letters: "A",
                                       flavour: "Vanilla Mistikkah",
                                       topper: "Congratulations (AED 32",
                                       customisedTopper: false,
                                       vat: 10,
                                       imageURL: ""),
                                 .init(id: "Long Acrylic Tray 006",
                                       price: 1053,
                                       count: 2,
                                       letters: "A",
                                       flavour: "Vanilla Mistikkah",
                                       topper: "Congratulations (AED 32",
                                       customisedTopper: false,
                                       vat: 10,
                                       imageURL: "")]

struct BagItemView: View {
    @State var ietm: BagViewItemModel
    var body: some View {
        VStack {
            HStack {
                Image(.tube018)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 127, height: 161)
                ZStack {
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
                        horizontalText(firstText: "Topper: ", secondText: "Congratulations (AED 32)")
                        Spacer()
                    }
                    .padding(.top, 5)
                }
                .padding(.leading, 12)
                Spacer()
            }
            .padding(.leading, 15)
            Divider()
                .padding(.top, 16)
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
                    Text("AED 479")
                        .font(.getFont(name: .libreBold, size: 12))
                }
                .padding(.trailing, 16)
            }
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
}

#Preview {
    BagView(count: 1)
}
