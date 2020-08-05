//
//  AnimationStack.swift
//  Animations
//
//  Created by Zr埋 on 2020/5/12.
//  Copyright © 2020 Zr埋. All rights reserved.
//

import SwiftUI

struct AnimationStack: View {
    @State var enabled = false
    
    var body: some View {
        Button("Tap Me") {
            self.enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enabled ? Color.blue : Color.red)
        .animation(nil)
        .foregroundColor(enabled ? .white : .black)
        .animation(.default)
        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
        .animation(.default)
    }
}

struct AnimationStack_Previews: PreviewProvider {
    static var previews: some View {
        AnimationStack()
    }
}
