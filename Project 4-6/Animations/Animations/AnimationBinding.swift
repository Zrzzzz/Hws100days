//
//  AnimationBinding.swift
//  Animations
//
//  Created by Zr埋 on 2020/5/12.
//  Copyright © 2020 Zr埋. All rights reserved.
//

import SwiftUI

struct AnimationBinding: View {
//    @State var animationAmount: CGFloat = 1
    @State var animationAmount1 = 0.0
    @State var animationAmount2 = 0.0
    var body: some View {
//        print(animationAmount)
//
//        return VStack {
//            Stepper("Scale Amount", value: $animationAmount.animation(), in: 1...10)
//
//            Spacer()
//
//            Button("Tap Me") {
//                self.animationAmount += 1
//            }
//            .padding(40)
//            .background(Color.red)
//            .foregroundColor(.white)
//            .clipShape(Circle())
//            .scaleEffect(animationAmount)
//        }
        
        VStack {
            Button("Tap Me") {
                withAnimation(Animation.easeInOut(duration: 2)) {
                           self.animationAmount1 += 360
                    self.animationAmount2 += 360
                       }

                   }
                   .padding(50)
                   .background(Color.red)
                   .foregroundColor(.white)
                   .clipShape(Circle())
            .rotation3DEffect(.degrees(animationAmount1), axis: (0, 1, 1))
            Spacer()
            Button("Tap M") {
                withAnimation(Animation.easeInOut(duration: 2)) {
                           
                       }

                   }
                   .padding(50)
                   .background(Color.red)
                   .foregroundColor(.white)
                   .clipShape(Circle())
            .rotation3DEffect(.degrees(animationAmount2), axis: (0, 10, 1))
        }.frame(width: UIScreen.main.bounds.width, height: 300, alignment: .center)
    }
}

struct AnimationBinding_Previews: PreviewProvider {
    static var previews: some View {
        AnimationBinding()
    }
}
