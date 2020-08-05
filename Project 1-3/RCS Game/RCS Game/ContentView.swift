//
//  ContentView.swift
//  RCS Game
//
//  Created by Zr埋 on 2020/5/4.
//  Copyright © 2020 Zr埋. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let options = ["Rock", "Paper", "Scissors"]
    @State var rightAns = ""
    @State var isRight = 0
    @State var showAlert = false
    
    
    var body: some View {
        VStack {
            Text("欢迎来到剪刀石头布")
                .font(.largeTitle)
                .fontWeight(.heavy)
            Text("选择你想出的")
                .padding(.top, 30)
            HStack {
                ForEach(0..<options.count) { index in
                    Button("\(self.options[index])") {
                        self.check(index)
                        self.showAlert = true
                    }
                }.alert(isPresented: $showAlert) { () -> Alert in
                    Alert(title: Text(result(isRight)), message: Text("对手出的是\(rightAns)"), dismissButton: .default(Text("确认")))
                }
            }
        }
    }
    
    func check(_ index: Int) {
        let ans = Int.random(in: 0..<3)
        rightAns = options[ans]
        switch index {
        case ans:
            isRight = 1
        case (ans + 3 - 1) % 3:
            isRight = 0
        case (ans + 3 + 1) % 3:
            isRight = 2
        default:
            return
        }
    }
    
    func result(_ state: Int) -> String {
        switch state {
        case 0:
            return "你输了"
        case 1:
            return "平手"
        case 2:
            return "你赢了"
        default:
            return "错误"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
