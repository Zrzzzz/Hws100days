//
//  AddView.swift
//  iExpense
//
//  Created by Zr埋 on 2020/6/18.
//  Copyright © 2020 Zr埋. All rights reserved.
//

import SwiftUI

struct AddView: View {
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
    
    @State private var showingAlert = false
    
    @ObservedObject var expenses: Expenses
    @Environment(\.presentationMode) var presentationMode
    
    static let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(Self.types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("amount", text: $amount)
                    .keyboardType(.numberPad)
            }
        .navigationBarTitle("Add new Expense")
        .navigationBarItems(trailing:
            Button("Save") {
                if self.name != "", let amount = Int(self.amount) {
                    let item = ExpenseItem(name: self.name, type: self.type, amount: amount)
                    self.expenses.items.append(item)
                    self.presentationMode.wrappedValue.dismiss()
                }
                else {
                    self.showingAlert = true
                }
                
            }
            .alert(isPresented: $showingAlert, content: { () -> Alert in
                Alert(title: Text("错误"), message: Text("请正确输入"), dismissButton: .cancel(Text("确认")))
            })
            )
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
