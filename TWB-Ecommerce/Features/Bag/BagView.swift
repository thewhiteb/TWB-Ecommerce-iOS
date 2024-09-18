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

#Preview {
    BagView(count: 0)
}
