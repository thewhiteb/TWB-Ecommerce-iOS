//
//  SplashView.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 06/08/2024.
//

import Foundation

import SwiftUI

struct SplashView: View {
    
    @State private var isFlowerVisible = true
    @State private var isSecondImageVisible = false
    @State private var rotationAngle = 0.0
    
    var body: some View {
        VStack {
                    if isFlowerVisible {
                        Image("flower_loading")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .rotationEffect(.degrees(rotationAngle))
                            .onAppear {
                                withAnimation(.linear(duration: 2.0)) {
                                    rotationAngle = 360.0
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                    isFlowerVisible = false
                                    isSecondImageVisible = true
                                }
                            }
                    } else if isSecondImageVisible {
                        Image("splash_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 236, height: 72)
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    
                                }
                            }
                    }
                }
                .padding()
                .background(Color.white)
    }
}

#Preview {
    SplashView()
}
