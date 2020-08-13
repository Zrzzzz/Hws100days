//
//  ContentView.swift
//  PhotoList
//
//  Created by Zr埋 on 2020/8/11.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var userData = [User]()
    
    var body: some View {
        ZStack {
            ScrollView {
                LazyVStack {
                    ForEach(0..<10) {
                        Text("\($0)")
                    }
                }
            }
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        self.showingImagePicker = true
                    }, label: {
                        Image(systemName: "plus")
                            .padding()
                            .background(Color.black.opacity(0.3))
                            .foregroundColor(.white)
                            .font(.title)
                            .clipShape(Circle())
                            .padding(.trailing)
                    })
                }
            }
        }
        .sheet(isPresented: $showingImagePicker, onDismiss: {
            
        }, content: {
            Text("hahaah")
            ImagePicker(image: self.$selectedImage)
        })
    }
}

struct User: Identifiable {
    var id: UUID
    var name: String
    var image: Image
    
    private enum CodingKeys: CodingKey {
        case id, name, image
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
