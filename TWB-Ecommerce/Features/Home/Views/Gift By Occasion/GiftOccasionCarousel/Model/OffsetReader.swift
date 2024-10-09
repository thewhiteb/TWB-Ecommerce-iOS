//
//  OffsetReader.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 10/09/2024.
//

import SwiftUI

struct OffsetKey: PreferenceKey{
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat){
        value = nextValue()
    }
}


extension View {
    @ViewBuilder
    func offsetX(completion: @escaping (CGFloat) -> ()) -> some View{
        self
            .overlay{
                GeometryReader{
                    let minX = $0.frame(in: .scrollView).minX
                    Color.clear
                        .preference(key: OffsetKey.self, value: minX)
                        .onPreferenceChange(OffsetKey.self, perform: {value in
                            completion(value)
                        })
                }
            }
    }
}

extension [ProductItem] {
    func indexOf(_ itemModel : ProductItem) -> Int {
        return self.firstIndex(of: itemModel) ?? 0
    }
}
