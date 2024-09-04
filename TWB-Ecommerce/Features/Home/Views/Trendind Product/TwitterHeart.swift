//
//  TwitterHeart.swift
//  TWB-Ecommerce
//
//  Created by Khurram Ansar on 03/09/2024.
//

import SwiftUI

func deg2rad(_ number: Double) -> Double {
    return number * Double.pi / 180
}

struct Spark: Hashable {
    var size: CGFloat = 15
    var x: CGFloat = 0
    var y: CGFloat = 0
    var x2: CGFloat = 0
    var y2: CGFloat = 0
    var duration: Double = 1.5
    var delay: Double = 1.2
    var color: Double
}

struct TwitterHeart: View {
    @State private var touch: Bool = false
    @State private var start: Bool = false
    @State private var finish: Bool = false

    private var base: Animation = Animation.timingCurve(0.54, 1.65, 0.68, 0.79, duration: 0.5)

    private var positions: [Spark] {
        var arr: [Spark] = []
        let shortDistance: Double = 10
        let longDistance: Double = 20

        for i in 0...6 {
            let angle = (Double(i) * 51) - 8
            let rad = deg2rad(angle)
            arr.append(Spark(
                size: 20,
                x: CGFloat(longDistance * cos(rad)),
                y: CGFloat(longDistance * sin(rad)),
                x2: CGFloat((longDistance + 10) * cos(rad)),
                y2: CGFloat((longDistance + 10) * sin(rad)),
                delay: 0.5,
                color: angle
            ))

        }
        return arr
    }

    var body: some View {
        ZStack {
            ZStack {

                sparks
                ZStack {
                    Image(systemName: "heart")
                        .resizable()
                        .scaleEffect(touch ? 0 : 1)
                        .aspectRatio(contentMode: .fit)
                        .opacity(touch ? 0 : 0.4)
                        .foregroundColor(Color(UIColor.white))
                        .animation(base)

                    Image(systemName: "heart.fill")
                        .resizable()
                        .scaleEffect(touch ? 1 : 0)
                        .aspectRatio(contentMode: .fit)
                        .opacity(touch ? 1 : 0)
                        .foregroundColor(Color(UIColor.systemRed))
                        .animation(Animation.timingCurve(0.17,1.67,0.61,0.77, duration: touch ? 0.8 : 0).delay(touch ? 0.8 : 0))

                }.frame(width: 25)
   
            }.frame(width: 25)

        }
        .frame(width: 25)
        .onTapGesture{
            if self.start {
                return
            }

            self.touch.toggle()

            if self.touch {
                self.start = true
                self.finish = false
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.start = false
                    self.finish = true
                }
            } else {
                self.finish = false
            }
        }
    }

    private var sparks: some View {
        ZStack {
            ForEach(positions, id: \.self) { pos in
                Circle()
                    .scaleEffect(x: touch ? 1 : 0.5, y: touch ? 1 : 0.5, anchor: .center)
                    .foregroundColor(Color(UIColor.red))
                    .opacity(touch ? 0.8 : 0)
                    .offset(x: touch ? pos.x : 0, y: touch ? pos.y : 0)
                    .frame(width: pos.size, height: pos.size)
                    .animation(Animation.timingCurve(0.5, 1, 0.89, 1, duration: touch ? pos.duration : 0).delay(touch ? 0.3 : 0))
                    .opacity(touch ? 0.4 : 1)
                    .animation(Animation.timingCurve(0.5, 1, 0.89, 1, duration: touch ? 0.5 : 0).delay(touch ? 1.5 : 0))
                    .scaleEffect(x: touch ? 0 : 1, y: touch ? 0 : 1, anchor: .center)
                    .offset(x: touch ? pos.x2 : 0, y: touch ? pos.y2 : 0)
                    .animation(Animation.timingCurve(0.5, 1, 0.89, 1, duration: touch ? 0.5 : 0).delay(touch ? pos.delay : 0))
            }
        }.frame(width: 20, height: 20)
    }
}

#Preview {
    TwitterHeart()
}
