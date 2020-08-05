//
//  AnimatableData.swift
//  Drawing
//
//  Created by Zr埋 on 2020/6/22.
//  Copyright © 2020 Zr埋. All rights reserved.
//

import SwiftUI

struct Trapezoid: Shape {
    var insetAmount: CGFloat
    var animatableData: CGFloat {
        get { insetAmount }
        set {self.insetAmount = newValue}
    }
    

    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 0, y: rect.maxY))
        path.addLines([
            CGPoint(x: insetAmount, y: rect.minY),
            CGPoint(x: rect.maxX - insetAmount, y: rect.minY),
            CGPoint(x: rect.maxX, y: rect.maxY),
            CGPoint(x: 0, y: rect.maxY)
        ])
        
        return path
    }
}

struct AnimatableData: View {
    @State private var insetAmount: CGFloat = 0
    
    var body: some View {
        VStack {
            Trapezoid(insetAmount: insetAmount)
                .frame(width: 200, height: 100)
                .onTapGesture {
                    withAnimation {
                        self.insetAmount = CGFloat.random(in: 10..<90)
                    }
            }
        }
    }
}

struct AnimatableData_Previews: PreviewProvider {
    static var previews: some View {
        AnimatableData()
    }
}
