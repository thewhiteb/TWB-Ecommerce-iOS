//
//  EmptyBagView.swift
//  TWB-Ecommerce
//
//  Created by Hassam Ali on 19/09/2024.
//

import SwiftUI

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
    EmptyBagView()
}
