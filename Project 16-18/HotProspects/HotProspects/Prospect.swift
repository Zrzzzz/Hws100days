//
//  Prospect.swift
//  HotProspects
//
//  Created by Zr埋 on 2020/8/12.
//

import SwiftUI

class Prospect: Identifiable, Codable {
    var id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    fileprivate(set) var isContacted = false
}

public func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}

class Prospects: ObservableObject {
    @Published private(set) var people: [Prospect]
    static let saveKey = "Data"
    
    init() {
        var fileUrl = getDocumentsDirectory()
        fileUrl = fileUrl.appendingPathComponent("data.json")
        
        do {
            let data = try Data(contentsOf: fileUrl)
            people = try JSONDecoder().decode([Prospect].self, from: data)
            
            print("读取成功")
        } catch {
            print(error)
            people = []
        }
    }
    
    func save() {
        var fileUrl = getDocumentsDirectory()
        fileUrl = fileUrl.appendingPathComponent("data.json")
        
        do {
            let data = try JSONEncoder().encode(people)
            try data.write(to: fileUrl, options: [.atomicWrite, .completeFileProtection])
        } catch {
            print("读取失败")
        }
    }
    
    func add(_ prospect: Prospect) {
        people.append(prospect)
        self.save()
    }
    
    func toggle(_ prospect: Prospect) {
        objectWillChange.send()
        prospect.isContacted.toggle()
        self.save()
    }
}
