//
//  ContentView.swift
//  WeSplit
//
//  Created by Zr埋 on 2020/5/2.
//  Copyright © 2020 Zr埋. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var numberOfPeople = ""
    @State var tipPercentage = 2
    @State var checkAmount = ""
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople) ?? 0
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0

        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    }
    
    let tipPercentages = [10, 15, 20, 25, 0]
    var body: some View {
        
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount).keyboardType(.decimalPad)
                    TextField("Number of People", text: $numberOfPeople).keyboardType(.decimalPad)
                }
                
                Section(header: Text("how much tip")) {
                    
                    Picker("Tip Persentage", selection: $tipPercentage) {
                        ForEach(0..<tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                }

                Section(header: Text("totalPerPerson")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                        .foregroundColor(tipPercentage == 4 ? .red : .black)
                }
            }
        .navigationBarTitle("666")
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
