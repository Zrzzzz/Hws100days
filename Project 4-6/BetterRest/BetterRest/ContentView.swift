//
//  ContentView.swift
//  BetterRest
//
//  Created by Zr埋 on 2020/5/11.
//  Copyright © 2020 Zr埋. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var sleepAmount = 8.0
    @State private var wakeUp = defaultWakeTime
    @State var coffeeAmount = 1
    
    @State var coffeeSelection = 1
    let coffeeSelections: [Int] = [1, 2, 3, 4, 5]
    
    @State var alertTitle = ""
    @State var alertMessage = ""
    @State var showingAlert = false
    
   
    
    static var defaultWakeTime: Date {
        var compoents = DateComponents()
        compoents.hour = 7
        compoents.minute = 0
        return Calendar.current.date(from: compoents) ?? Date()
    }
    
    
    func calculateBedTime() {
        let model = SleepCalculator()
        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
        let hour = (components.hour ?? 0) * 3600 // to get seconds
        let minute = (components.minute ?? 0) * 60
        
        do {
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            // setting alert
            alertTitle = "SUCCESS"
            alertMessage = "Your ideal bedtime is \(formatter.string(from: sleepTime))"
            showingAlert = true
        } catch {
            alertTitle = "ERROR"
            alertMessage = "Sorry, there was a problem when calculating your bedtime."
            showingAlert = true
        }
        
        
    }
    
    var body: some View {
        //        var components = DateComponents()
        //        components.hour = 8
        //        components.minute = 0
        //        let date = Calendar.current.date(from: components) ?? Date()
        
        //        let components = Calendar.current.dateComponents([.hour, .minute], from: Date())
        //        let hour = components.hour ?? 0
        //        let minute = components.minute ?? 0
        
        //        let formatter = DateFormatter()
        //        formatter.timeStyle = .short
        //        let dateString = formatter.string(from: Date())
        NavigationView {
            Form {
                Text("When do you want to wake up?")
                    .modifier(fontModifier())
                
                DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                    .datePickerStyle(WheelDatePickerStyle())
                
                Section {
                    Text("Desired amount of sleep")
                        .modifier(fontModifier())
                    Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
                        Text("\(sleepAmount, specifier: "%g") hours")
                    }
                }
                VStack(alignment: .leading, spacing: 0) {
//                    Text("Daliy coffee intake")
//                        .modifier(fontModifier())
//
//                    Stepper(value: $coffeeAmount, in: 1...20) {
//                        Text("\(coffeeAmount) cup")
//                    }

                    Picker("Daliy coffee intake", selection: $coffeeSelection) {
                        ForEach(0..<coffeeSelections.count) {
                            Text("\(self.coffeeSelections[$0])")
                        }
                    }
                }
            }
            .alert(isPresented: $showingAlert, content: {
                Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            })
                .navigationBarTitle("Better Rest")
                .navigationBarItems(trailing:
                        Button("Calculate") {
                            self.calculateBedTime()
                        }
            )
        }
    }
}


struct fontModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.font(.headline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
