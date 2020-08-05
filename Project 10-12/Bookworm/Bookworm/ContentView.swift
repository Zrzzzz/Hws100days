//
//  ContentView.swift
//  Bookworm
//
//  Created by Zr埋 on 2020/6/25.
//  Copyright © 2020 Zr埋. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @FetchRequest(entity: Book.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Book.title, ascending: true),
        NSSortDescriptor(keyPath: \Book.author, ascending: true)
    ]) var books: FetchedResults<Book>
    @Environment(\.managedObjectContext) var moc
    
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Count: \(books.count)")
                    .navigationBarTitle("Bookworm")
                    .navigationBarItems(
                        leading: EditButton()
                        , trailing:
                        Button(action: {
                            self.showingAddScreen.toggle()
                        }, label: {
                            Image(systemName: "plus")
                        })
                            .sheet(isPresented: $showingAddScreen) {
                                AddBookView().environment(\.managedObjectContext, self.moc)
                        }
                )
                List {
                    ForEach(books, id: \.self) { book in
                        NavigationLink(destination: DetailView(book: book)) {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            
                            VStack(alignment: .leading) {
                                Text(book.title ?? "Unknown Title")
                                    .foregroundColor(book.rating == 1 ? Color.red : Color.black)
                                    .font(.headline)
                                HStack {
                                    Text(book.author ?? "Unknown Author")
                                        .foregroundColor(.secondary)
                                    
                                    Text(String(describing: book.date ?? Date()))
                                        .foregroundColor(.secondary)
                                    
                                }
                            }
                        }
                    }
                .onDelete(perform: deleteBooks)
                }
            }
            
        }
    }
}

extension ContentView {
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            let book = books[offset]
            
            moc.delete(book)
        }
        
        do {
            try? self.moc.save()
        } catch {
            print("删除失败")
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
