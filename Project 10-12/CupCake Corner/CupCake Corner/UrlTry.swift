//
//  UrlTry.swift
//  CupCake Corner
//
//  Created by Zr埋 on 2020/6/24.
//  Copyright © 2020 Zr埋. All rights reserved.
//

import SwiftUI

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct UrlTry: View {
    @State private var results = [Result]()
    
    func loadData() {
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data, res, err) in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                    // we have good data – go back to the main thread
                    DispatchQueue.main.async {
                        // update our UI
                        self.results = decodedResponse.results
                    }

                    // everything is good, so we can exit
                    return
                }
            }

            // if we're still here it means there was a problem
            print("Fetch failed: \(err?.localizedDescription ?? "Unknown error")")
        }.resume()
    }

    
    var body: some View {
        List(results, id: \.trackId) { item in
            VStack(alignment: .leading) {
                Text(item.trackName)
                    .font(.headline)
                Text(item.collectionName)
            }
        }
    .onAppear(perform: loadData)
    }
}

struct UrlTry_Previews: PreviewProvider {
    static var previews: some View {
        UrlTry()
    }
}
