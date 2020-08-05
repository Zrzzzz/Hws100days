//
//  AnimatablePair.swift
//  Drawing
//
//  Created by Zr埋 on 2020/6/22.
//  Copyright © 2020 Zr埋. All rights reserved.
//

import SwiftUI
struct Checkerboard: Shape {
    var rows: Int
    var columns: Int

    public var animatableData: AnimatablePair<Double, Double> {
        get {
           AnimatablePair(Double(rows), Double(columns))
        }

        set {
            self.rows = Int(newValue.first)
            self.columns = Int(newValue.second)
        }
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()

        // figure out how big each row/column needs to be
        let rowSize = rect.height / CGFloat(rows)
        let columnSize = rect.width / CGFloat(columns)

        // loop over all rows and columns, making alternating squares colored
        for row in 0..<rows {
            for column in 0..<columns {
                if (row + column).isMultiple(of: 2) {
                    // this square should be colored; add a rectangle here
                    let startX = columnSize * CGFloat(column)
                    let startY = rowSize * CGFloat(row)

                    let rect = CGRect(x: startX, y: startY, width: columnSize, height: rowSize)
                    path.addRect(rect)
                }
            }
        }

        return path
    }
}

struct AnimatablePairr: View {
    @State private var rows = 4
    @State private var columns = 4
    @State private var change = false
    
   
    
    var body: some View {
        Checkerboard(rows: rows, columns: columns)
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.5)) {
                    self.change.toggle()
                    if self.change {
                        self.rows = 6
                        self.columns = 6
                    } else {
                        self.rows = 4
                        self.columns = 4
                    }
                }
        }
    }
}

struct AnimatablePair_Previews: PreviewProvider {
    static var previews: some View {
        AnimatablePairr()
    }
}
