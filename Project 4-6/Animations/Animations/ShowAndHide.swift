//
//  ShowAndHide.swift
//  Animations
//
//  Created by Zr埋 on 2020/5/12.
//  Copyright © 2020 Zr埋. All rights reserved.
//

import SwiftUI

struct ShowAndHide: View {
    @State var isShowingRed = false
    
    var body: some View {
        VStack {
            Button("Tap ME") {
                withAnimation {
                    self.isShowingRed.toggle()
                }
            }
            if isShowingRed {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            }
        }
    }
}

struct ShowAndHide_Previews: PreviewProvider {
    static var previews: some View {
        ShowAndHide()
    }
}
