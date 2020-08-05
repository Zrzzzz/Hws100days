//
//  SecondView.swift
//  iExpense
//
//  Created by Zr埋 on 2020/5/14.
//  Copyright © 2020 Zr埋. All rights reserved.
//

import SwiftUI

struct SecondView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Button("DisMISS") {
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
