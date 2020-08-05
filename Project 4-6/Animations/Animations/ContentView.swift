//
//  ContentView.swift
//  Animations
//
//  Created by Zr埋 on 2020/5/12.
//  Copyright © 2020 Zr埋. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var animationAmount: CGFloat = 1
    
    var body: some View {
        Button("Tap Me") {
//            self.animationAmount += 1
        }
        .padding(50)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .overlay(
        Circle()
            .stroke(Color.red)
        .scaleEffect(animationAmount)
        .opacity(Double(2 - animationAmount))
        .animation(
            Animation.easeOut(duration: 1)
                .repeatForever(autoreverses: false)
        )
        )
            .onAppear {
                self.animationAmount = 2
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
