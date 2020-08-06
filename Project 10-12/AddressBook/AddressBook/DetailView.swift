//
//  DetailView.swift
//  AddressBook
//
//  Created by Zr埋 on 2020/8/6.
//

import SwiftUI

struct DetailView: View {
    var user: User
    
    var body: some View {
        ScrollView {
           
                Text(user.name ?? "")
                    .font(.title)
                VStack {
                    Text("age: \(user.age ?? 0)")
                    Text(user.registered ?? "")
                }
                .foregroundColor(.secondary)
                Text(user.email ?? "")
                    .foregroundColor(.blue)
                Text(user.about ?? "")
                    .padding(.all, 10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25.0)
                            .stroke(Color.black, style: StrokeStyle(lineWidth: 2, dash: [10]))
                    )
            
                Text("Friends")
                    .font(.title)
                ForEach(user.friends ?? []) {
                    Text($0.name)
                }
                
            
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(user: User(id: "123", isActive: true, name: "zzz", age: 19, company: "company", email: "zzz@gmail.com", address: "china", about: "this is a boy", registered: "2020.12.1", tags: ["hhh", "yoyo"], friends: [
            Friend(id: "111", name: "hahaha")
        ]))
    }
}
