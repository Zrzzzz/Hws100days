//
//  UserRow.swift
//  AddressBook
//
//  Created by Zr埋 on 2020/8/6.
//

import SwiftUI

struct UserRow: View {
    var user: User
    
    let layout = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading) {
                HStack(alignment: .firstTextBaseline) {
                    Text(user.name ?? "")
                        .font(.title)
                    Text("age: " + (user.age?.description ?? "unknown"))
                        .foregroundColor(.secondary)
                }
                Text(user.company ?? "")
                Text(user.registered ?? "")
            }
            
            Spacer()

            VStack(spacing: 10) {
                ForEach(user.tags ?? [], id: \.self) {
                    Text($0)
                        .padding(.all, 5)
                        .background(Color.green)
                        .cornerRadius(15)
                }
            }
            
//            FIXME:  Fatal error: each layout item may only occur once
//            LazyVGrid(columns: layout, spacing: 10) {
//                ForEach(user.tags ?? [], id: \.self) {
//                    Text($0)
//                        .padding(.all, 5)
//                        .background(Color.green)
//                        .cornerRadius(15)
//                }
//            }
        }
        .frame(width: UIScreen.main.bounds.width - 50)
        .padding(.horizontal, 20)
        .padding(.bottom, 10)
        .background(Color.yellow)
        .cornerRadius(20)
        
            
    }
}

struct UserRow_Previews: PreviewProvider {
    static var previews: some View {
        UserRow(user: User(id: "123", isActive: true, name: "zzz", age: 19, company: "company", email: "zzz@gmail.com", address: "china", about: "this is a boy", registered: "2020.12.1", tags: ["hhh", "yoyo"], friends: [
            Friend(id: "111", name: "hahaha")
        ]))
    }
}
