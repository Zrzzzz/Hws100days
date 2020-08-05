//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Zr埋 on 2020/5/3.
//  Copyright © 2020 Zr埋. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            GridStack(rows: 3, cols: 4) { (row, col) in
                
                    Image(systemName: "\(row * 4 + col).circle")
                    Text("R\(row) C\(col)")
                
            }
            yes()
            
        }
    }
}

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    
    init(rows: Int, cols: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
        self.rows = rows
        self.columns = cols
        self.content = content
    }

    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<self.columns, id: \.self) { column in
                        self.content(row, column)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct yes: View {
    var body: some View {
        Text("u are happy")
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}
