//
//  Content.swift
//  Turbine
//
//  Created by Mariana Meireles on 16/03/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct Content {
    
    let calculator: Bool?
    var gallery: [[String:String]]?
    var haveGallery: Bool?
    let iconImage1: String?
    let iconImage2: String?
    let text: String?
    let title: String?
    let webSites: [String]?
    
    init(snapshot: DataSnapshot) {
        
        let snapshotValue = snapshot.value as! NSDictionary
        
        if let calculator = snapshotValue["calculator"] as? Bool {
            self.calculator = calculator
        } else {
            self.calculator = false
        }
        if let gallery = snapshotValue["gallery"] as? [[String:String]] {
            self.gallery = gallery
        } else {
            self.gallery = nil
        }
        if let haveGallery = snapshotValue["haveGallery"] as? Bool {
            self.haveGallery = haveGallery
        } else {
            self.haveGallery = false
        }
        if let iconImage1 = snapshotValue["iconImage1"] as? String {
            self.iconImage1 = iconImage1
        } else {
            self.iconImage1 = "Image1"
        }
        if let iconImage2 = snapshotValue["iconImage2"] as? String {
            self.iconImage2 = iconImage2
        } else {
            self.iconImage2 = "Image1"
        }
        if let text = snapshotValue["text"] as? String {
            self.text = text
        } else {
            self.text = nil
        }
        if let title = snapshotValue["title"] as? String {
            self.title = title
        } else {
            self.title = ""
        }
        if let webSites = snapshotValue["webSites"] as? [String] {
            self.webSites = webSites
        } else {
            self.webSites = nil
        }
    }
    
    
    init(dictionary: [String: AnyObject]) {
        self.calculator = dictionary["calculator"] as? Bool
        self.gallery = dictionary["gallery"] as? [[String:String]]
        self.haveGallery = dictionary["haveGallery"] as? Bool
        self.iconImage1 = dictionary["iconImage1"] as? String
        self.iconImage2 = dictionary["iconImage2"] as? String
        self.text = dictionary["text"] as? String
        self.title = dictionary["title"] as? String
        self.webSites = dictionary["webSites"] as? [String]
    }
    
}

