//
//  Movie+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Zr埋 on 2020/8/5.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var name: String?
    @NSManaged public var title: String?
    @NSManaged public var year: Int16
    
    public var wrappedTitle: String {
        title ?? "Unknown title"
    }

}

extension Movie : Identifiable {

}
