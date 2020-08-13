//
//  Card.swift
//  Flashzilla
//
//  Created by Zr埋 on 2020/8/12.
//

import SwiftUI

struct Card: Codable {
    let prompt: String
    let answer: String
    
    static var example: Card {
        Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
    }
}
