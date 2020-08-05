//
//  ActivityModel.swift
//  Challenge
//
//  Created by Zr埋 on 2020/6/30.
//  Copyright © 2020 Zr埋. All rights reserved.
//

import SwiftUI

struct ActivityItem: Identifiable, Codable {
    var id = UUID()
    var name = ""
    var description = ""
    var completeTimes: Int = 0
}

class Activity: ObservableObject {
    init() {
        if let items = UserDefaults.standard.data(forKey: "Activity") {
            let activities = try? JSONDecoder().decode([ActivityItem].self, from: items)
            self.activities = activities ?? []
        } else {
            self.activities = []
        }
    }
    
    @Published var activities = [ActivityItem]() {
        didSet {
            if let items = try? JSONEncoder().encode(self.activities) {
                UserDefaults.standard.set(items, forKey: "Activity")
            }
        }
    }
}
