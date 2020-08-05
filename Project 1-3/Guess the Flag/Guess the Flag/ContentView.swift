//
//  ContentView.swift
//  Guess the Flag
//
//  Created by Zr埋 on 2020/5/3.
//  Copyright © 2020 Zr埋. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var score = 0
    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    @State var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State var rotateDegree = 0.0
    @State var opacity = 1.0
    
    var body: some View {
        ZStack {
            Color(.brown)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 30) {
                VStack {
                    Group {
                        Text("Tap the flag of")
                            .fontWeight(.heavy)
                        Text(countries[correctAnswer])
                    }
                    .foregroundColor(.white)
                    .font(.largeTitle)

                }
                ForEach(0 ..< 3) { index in
                    Button(action: {
                        self.flagTapped(index)
                        withAnimation(.default) {
                            self.rotateDegree += 360
                            self.opacity = 0.25
                        }
                    }) {
                        Image(self.countries[index])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(Color.black, lineWidth: 3))
                            .shadow(color: .black, radius: 2)
                            .opacity(index == self.correctAnswer ? 1 : self.opacity)
                            .rotation3DEffect(.degrees(index == self.correctAnswer ? self.rotateDegree : 0), axis: (0, 1, 0))
                            .animation(.default)
                            
                    }
                }.alert(isPresented: self.$showingScore) { () -> Alert in
                    Alert(title: Text(self.scoreTitle),
                          message: Text("你现在的得分\(self.score)\n还继续玩吗"),
                          primaryButton: .cancel(Text("不玩了")),
                          secondaryButton: .default(Text("玩!")) {
                        self.askQuestion()
                    })
                }
                Spacer()
            }
        }
    }
    
    func flagTapped(_ number: Int) {
        scoreTitle = number == correctAnswer ? "Correct" : "False"
        
        if number == correctAnswer {
            score += 1
        }
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0..<2)
        self.opacity = 1
        self.rotateDegree = 0.0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
