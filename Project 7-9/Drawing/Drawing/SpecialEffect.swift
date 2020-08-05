//
//  SpecialEffect.swift
//  Drawing
//
//  Created by Zr埋 on 2020/6/22.
//  Copyright © 2020 Zr埋. All rights reserved.
//

import SwiftUI

struct SpecialEffect: View {
    @State private var amount: CGFloat = 0.0

    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(Color.red)
                    .frame(width: 200 * amount)
                    .offset(x: -50, y: -80)
                    .blendMode(.screen)

                Circle()
                    .fill(Color.green)
                    .frame(width: 200 * amount)
                    .offset(x: 50, y: -80)
                    .blendMode(.screen)

                Circle()
                    .fill(Color.blue)
                    .frame(width: 200 * amount)
                    .blendMode(.screen)
                
                Image("1")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .saturation(Double(amount))
                .blur(radius: (1 - amount) * 20)
            }
            .frame(width: 300, height: 300)

            Slider(value: $amount)
                .padding()
            
            Text("\(self.amount)")
                .background(Color.yellow)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.green)
        .edgesIgnoringSafeArea(.all)
    }
}

struct SpecialEffect_Previews: PreviewProvider {
    static var previews: some View {
        SpecialEffect()
    }
}
