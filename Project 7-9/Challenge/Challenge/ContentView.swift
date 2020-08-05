//
//  ContentView.swift
//  Challenge
//
//  Created by Zr埋 on 2020/6/30.
//  Copyright © 2020 Zr埋. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var activity = Activity()
    @State private var showingAddView = false
    
    var body: some View {
        NavigationView {
            VStack {
                List(activity.activities) { activity in
                    NavigationLink(destination: DetailView(activity: self.activity, activityItem: activity)) {
                        VStack {
                            Text(activity.name)
                                .font(.headline)
                            Text(activity.description)
                                .font(.subheadline)
                        }
                    }
                }
                
                Button("Add a new activity") {
                    self.showingAddView = true
                }
                .sheet(isPresented: $showingAddView) {
                    AddView(activity: self.activity)
                }
                Button("Remove ALL") {
                    self.activity.activities.removeAll()
                }
            }
        .navigationBarTitle("Activity List")
        }
   
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
