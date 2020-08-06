//
//  User.swift
//  AddressBook
//
//  Created by Zr埋 on 2020/8/6.
//

import SwiftUI

// MARK: - User
struct User: Codable, Identifiable {
    var id: String
    var isActive: Bool?
    var name: String?
    var age: Int?
    var company, email, address, about: String?
    var registered: String?
    var tags: [String]?
    var friends: [Friend]?
}

// MARK: - Friend
struct Friend: Codable, Identifiable {
    var id, name: String
}

