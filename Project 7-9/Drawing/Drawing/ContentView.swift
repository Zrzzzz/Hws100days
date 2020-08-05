//
//  ContentView.swift
//  Drawing
//
//  Created by Zr埋 on 2020/6/22.
//  Copyright © 2020 Zr埋. All rights reserved.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

        return path
    }
}

struct Arc: InsettableShape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool
    var insetAmount: CGFloat = 0
    
    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
         let modifiedStart = startAngle - rotationAdjustment
         let modifiedEnd = endAngle - rotationAdjustment

         var path = Path()
         path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 - insetAmount, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)

        
        
        return path
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        return arc
    }
}

struct Flower: Shape {
    var petalOffset: Double = -20
    var petalWidth: Double = 100
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        for number in stride(from: 0, to: CGFloat.pi * 2, by: CGFloat.pi / 4) {
            let rotation = CGAffineTransform(rotationAngle: number)
            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))
            let originPetal = Path(ellipseIn: CGRect(x: CGFloat(petalOffset), y: 0, width: CGFloat(petalWidth), height: rect.width / 2))
            let rotatedPetal = originPetal.applying(position)
            
            path.addPath(rotatedPetal)
        }
        
        return path
    }
}

struct ContentView: View {
    @State private var petalOffset = -20.0
    @State private var petalWidth = 100.0
    @State private var colorStyle = 0.0
    
    var body: some View {
//        Triangle()
//            .stroke(Color.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
//            .frame(width: 300, height: 300)
//        Arc(startAngle: .degrees(0), endAngle: .degrees(270), clockwise: true)
//            .inset(by: 10)
//            .strokeBorder(Color.blue, lineWidth: 10)
        
//            .frame(width: 300, height: 300)
        
//        Circle()
//            .strokeBorder(Color.blue, lineWidth: 10)
        
//        VStack {
//                   Flower(petalOffset: petalOffset, petalWidth: petalWidth)
////                       .stroke(Color.red, lineWidth: 1)
//                    .fill(Color.black, style: FillStyle(eoFill: false, antialiased: false))
//
//                   Text("Offset")
//                   Slider(value: $petalOffset, in: -40...40)
//                       .padding([.horizontal, .bottom])
//
//                   Text("Width")
//                   Slider(value: $petalWidth, in: 0...100)
//                       .padding(.horizontal)
//               }
        
//        VStack {
//            Text("hello world")
//                .frame(width: 300, height: 300)
//                .border(ImagePaint(image: Image("1"), sourceRect: CGRect(x: 0, y: 0, width: 1, height: 1), scale: 0.2), width: 150)
//            Capsule()
//            .strokeBorder(ImagePaint(image: Image("1"), scale: 0.1), lineWidth: 20)
//            .frame(width: 300, height: 200)
//        }
        
        VStack {
            ColorCircleCycle(amount: self.colorStyle)
                .frame(width: 300, height: 300)
            
            Slider(value: $colorStyle)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
