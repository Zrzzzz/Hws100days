//
//  ColorCircleCycle.swift
//  Drawing
//
//  Created by Zr埋 on 2020/6/22.
//  Copyright © 2020 Zr埋. All rights reserved.
//

import SwiftUI

struct ColorCircleCycle: View {
    var amount = 0.0
    var steps = 100

    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Circle()
                    .inset(by: CGFloat(value))
                    .strokeBorder(LinearGradient(gradient: Gradient(colors: [
                        self.color(for: value, brightness: 1),
                        self.color(for: value, brightness: 0.5)
                    ]), startPoint: .top, endPoint: .bottom), lineWidth: 2)
            }
        }.drawingGroup()
    }

    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(self.steps) + self.amount

        while targetHue > 1 {
            targetHue -= 1
        }

        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct ColorCircleCycle_Previews: PreviewProvider {
    static var previews: some View {
        ColorCircleCycle()
    }
}
