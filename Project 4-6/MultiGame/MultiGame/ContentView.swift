//
//  ContentView.swift
//  MultiGame
//
//  Created by Zr埋 on 2020/6/13.
//  Copyright © 2020 Zr埋. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var questions: [Question] = [] {
        didSet {
            if questions.count != 0 {
                self.question = questions[0]
            }
        }
    }
    
    @State var currentQuestion = 0 {
        didSet {
            self.question = questions[currentQuestion]
        }
    }
    
    @State private var showingAlert = false
    @State private var showingCheck = false
    
    @State var question: Question = Question()
    @State var answer = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Text("\(question.number1) * \(question.number2) = ?")
                    .font(.largeTitle)
                
                TextField("输入答案", text: $answer)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                    .frame(width: UIScreen.main.bounds.width / 2, alignment: .center)
                HStack {
                    Button(action: {
                        self.quesControl(control: .pre)
                    }) {
                        Text("上一题")
                        .modifier(ButtonStyle())
                    }
                    
                    Button(action: {
                        self.showingCheck = true
                    }) {
                        Text("检查")
                        .modifier(ButtonStyle())
                    }
                    .alert(isPresented: $showingCheck) {
                        self.check()
                    }
                    
                    Button(action: {
                        self.quesControl(control: .next)
                    }) {
                        Text("下一题")
                        .modifier(ButtonStyle())
                    }
                }
            }
            .navigationBarTitle("问题列表")
            .navigationBarItems(trailing: NavigationLink(destination: SettingView(questions: self.$questions), label: {
                Image(systemName: "gear")
            }))
        }
        .alert(isPresented: $showingAlert) { () -> Alert in
            Alert(title: Text("错误"), message: Text("你应当先设置问题"), dismissButton: .cancel())
        }
    }
    
    func check() -> Alert {
        do {
            let ans = try? Int(self.answer)
            if ans == question.answer {
                return Alert(title: Text("正确"), message: Text("回答正确"), dismissButton: .default(Text("确认")))
            } else {
                return Alert(title: Text("错误"), message: Text("答案应该是\(self.question.answer)"), dismissButton: .default(Text("确认")))
            }
        } catch {
            return Alert(title: Text("错误"), message: Text("请输入正确的数字"), dismissButton: .default(Text("确认")))
        }
    }
    
    enum Control {
        case next, pre
    }
    
    func quesControl(control: Control) {
        if self.questions.count == 0 {
            showingAlert = true
            return
        }
        
        switch control {
        case .next:
            guard currentQuestion != questions.count - 1 else {
                return
            }
            currentQuestion += 1
        default:
            guard currentQuestion != 0 else {
                return
            }
            currentQuestion -= 1
        }
    }
}

struct ButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .foregroundColor(.white)
            .background(Color.red)
        
        .clipShape(Capsule())
            .padding()
        .shadow(radius: 4)
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView( currentQuestion: 0)
    }
}
