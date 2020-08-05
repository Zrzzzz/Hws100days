//
//  DetailView.swift
//  Challenge
//
//  Created by Zr埋 on 2020/6/30.
//  Copyright © 2020 Zr埋. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var activity: Activity
    @State var activityItem: ActivityItem
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text(activityItem.name)
                .font(.largeTitle)
            Text(activityItem.description)
            
            Stepper(value: $activityItem.completeTimes) {
                Text("Times you have achieved -- \(self.activityItem.completeTimes)")
            }
            
            Button("Save") {
                let index = self.activity.activities.firstIndex {
                    $0.id == self.activityItem.id
                }
                self.activity.activities[index!] = self.activityItem
                self.presentationMode.wrappedValue.dismiss()
            }
            
            Spacer()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(activity: Activity(), activityItem: ActivityItem())
    }
}
