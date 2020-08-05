//
//  Question.swift
//  MultiGame
//
//  Created by Zr埋 on 2020/6/27.
//  Copyright © 2020 Zr埋. All rights reserved.
//

import SwiftUI

struct Question: Identifiable {
    let id = UUID()
    var number1 = 1
    var number2 = 1
    
    var answer: Int {
        let res = number1 * number2
        return res
    }
    
    init() {
        
    }
    
    init(max: Int) {
        geneRandomly(max: max)
    }
    
    mutating func geneRandomly(max number: Int) {
        number1 = Int.random(in: 1...number)
        number2 = Int.random(in: 1...number)
    }
}
