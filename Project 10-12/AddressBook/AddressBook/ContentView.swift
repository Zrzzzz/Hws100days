//
//  ContentView.swift
//  AddressBook
//
//  Created by Zr埋 on 2020/8/6.
//

import SwiftUI

struct ContentView: View {
    @State var users: [User] = []
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(users) { user in
                    NavigationLink(
                        destination: DetailView(user: user),
                        label: {
                            UserRow(user: user)
                        })
                        .padding(.vertical, 10)
                }
            }
            .navigationTitle("Friend Face")
            .onAppear(perform: initData)
        }
    }
    
    private func initData() {
        let request = URLRequest(url: URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!)
            
        URLSession.shared.dataTask(with: request) { data, res, err in
            if let data = data {
                if let resArr = try? JSONDecoder().decode([User].self, from: data) {
                    DispatchQueue.main.async {
                        self.users = resArr
                    }
                    return
                }
            }
            
            
        }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
