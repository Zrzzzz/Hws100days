//
//  ContentView.swift
//  iExpense
//
//  Created by Zr埋 on 2020/5/14.
//  Copyright © 2020 Zr埋. All rights reserved.
//

import SwiftUI


struct ExpenseItem: Identifiable, Codable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Int
}

class Expenses: ObservableObject {
    init() {
        if let items = UserDefaults.standard.data(forKey: "Items") {
            if let decoded = try? JSONDecoder().decode([ExpenseItem].self, from: items) {
                self.items = decoded
            }
        } else {
            self.items = []
        }
        
    }
    
    @Published var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
}


struct ContentView: View {
    @ObservedObject var expenses = Expenses()
    @State var showingAddExpense = false
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    VStack {
                        HStack {
                            Text(item.name)
                            Text("$\(item.amount)")
                        }
                        Spacer()
                        Text(item.type)
                    }
                    
                }
                .onDelete { (indexset) in
                    self.expenses.items.remove(atOffsets: indexset)
                }
                .onMove { indecies, newOffset in
                    self.expenses.items.move(fromOffsets: indecies, toOffset: newOffset)
                }
                
            }
            .navigationBarTitle("iExpense")
            .navigationBarItems(
                leading: EditButton(),
                trailing:
                Button(action: {
                    self.showingAddExpense.toggle()
                }, label: {
                    Image(systemName: "plus")
                })
                    .sheet(isPresented: $showingAddExpense) {
                        AddView(expenses: self.expenses)
                }
            )
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
