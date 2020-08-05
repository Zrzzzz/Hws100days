//
//  SettingView.swift
//  MultiGame
//
//  Created by Zr埋 on 2020/6/27.
//  Copyright © 2020 Zr埋. All rights reserved.
//

import SwiftUI

struct SettingView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var questions: [Question]
    
    @State var multiRange = 2
    @State var quesCount = 5
    let quesCounts = [5, 10, 15, 20]
    
    var body: some View {
            Form {
                Section {
                    Text("选择乘法表的范围")
                        .font(.headline)
                    
                    Stepper(value: $multiRange, in: 2...12) {
                        Text("1 到 \(multiRange)")
                    }
                    
                    Picker("选择问题数量", selection: $quesCount) {
                        ForEach(quesCounts, id: \.self) {
                            Text("\($0)")
                        }
                    }
                }
                
                Section {
                    Button(action: {
                        self.geneQues()
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("生成问题")
                    }
                }
                
                
            }
            .navigationBarTitle("设置问题")
    }
    
    func geneQues() {
        questions = []
        print(quesCount)
        
        for _ in 0..<quesCount {
            let ques = Question(max: multiRange)
            questions.append(ques)
        }
    }
}

//struct SettingView_Previews: PreviewProvider {
//    @State let questions = [Question(number1: 0, number2: 0, tmpAns: 0)]
//    
//    static var previews: some View {
//        SettingView(questions: )
//    }
//}
