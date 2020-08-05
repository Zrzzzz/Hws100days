//
//  modify.swift
//  Animations
//
//  Created by Zr埋 on 2020/5/13.
//  Copyright © 2020 Zr埋. All rights reserved.
//

import SwiftUI

struct modify: View {
    var body: some View {
        Rectangle()
            .frame(width: 200, height: 200)
            .transition(.pivot)
    }
}

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content.rotationEffect(.degrees(amount), anchor: anchor).clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(active: CornerRotateModifier(amount: +90, anchor: .topLeading), identity: CornerRotateModifier(amount: 0, anchor: .topLeading))
    }
}

struct modify_Previews: PreviewProvider {
    static var previews: some View {
        modify()
    }
}
