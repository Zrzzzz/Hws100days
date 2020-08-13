//
//  MKPointAnnotation-ObservableObject.swift
//  BucketList
//
//  Created by Zr埋 on 2020/8/9.
//

import SwiftUI
import MapKit

extension MKPointAnnotation: ObservableObject {
    public var wrappedTitle: String {
        get {
            self.title ?? "Unknown value"
        }
        
        set {
            title = newValue
        }
    }
    
    public var wrappedSubtitle: String {
        get {
            self.subtitle ?? "Unknown value"
        }
        
        set {
            subtitle = newValue
        }
    }
}
