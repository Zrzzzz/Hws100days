//
//  ContentView.swift
//  AddressBook
//
//  Created by Zr埋 on 2020/8/6.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("get data") {
                let request = URLRequest(url: URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!)
                
                URLSession.shared.dataTask(with: request) { data, res, err in
                    if let data = data {
                        if let resArr = try? JSONDecoder().decode([User].self, from: data) {
                            DispatchQueue.main.async {
                                print(resArr)
                            }
                            return 
                        }
                    }
                    
                    
                }.resume()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
