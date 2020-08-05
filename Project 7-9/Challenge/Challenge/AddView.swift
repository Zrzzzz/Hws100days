//
//  AddView.swift
//  Challenge
//
//  Created by Zr埋 on 2020/6/30.
//  Copyright © 2020 Zr埋. All rights reserved.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var activity: Activity
    @State private var activityName = ""
    @State private var activityDesc = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Input activity name", text: $activityName)
                    TextField("Input activity description", text: $activityDesc)
                    
                }
                
                Section {
                    Button(action: {
                        let item = ActivityItem(id: UUID(), name: self.activityName, description: self.activityDesc, completeTimes: 0)
                        self.activity.activities.append(item)
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Save it")
                    }
                }
            }
        .navigationBarTitle("Adding a New Activity")
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(activity: Activity())
    }
}
