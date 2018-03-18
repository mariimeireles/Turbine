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
    
    let key: String
    let calculator: Bool
    var gallery: [[String:String]]?
    var haveGallery: Bool
    let iconImage1: String
    let iconImage2: String
    let text: String?
    let title: String
    let webSites: [String]?
    let itemRef: DatabaseReference?
    
//    init(key: String, calculator: Bool, gallery: [AnyObject]?, haveGallery: Bool, iconImages: IconImages, text: String?, title: String, webSites: [String]?) {
//
//        self.key = key
//        self.calculator = calculator
//        self.gallery = gallery
//        self.haveGallery = haveGallery
//        self.iconImage1 = iconImages.iconImage1
//        self.iconImage2 = iconImages.iconImage2
//        self.text = text
//        self.title = title
//        self.webSites = webSites
//        self.itemRef = nil
//    }
    
    init(snapshot: DataSnapshot) {
        
        self.key = snapshot.key
        self.itemRef = snapshot.ref
        self.iconImage1 = "Image1"
        self.iconImage2 = "Image1"
        let snapshotValue = snapshot.value as! NSDictionary
        
        if let calculator = snapshotValue["calculator"] as? Bool {
            self.calculator = calculator
        } else {
            self.calculator = false
        }
        if let gallery = snapshotValue["gallery"] as? [[String:String]] {
            self.gallery = gallery
//            for item in gallery {
//                for image in item {
//                    if image.key == "imagePath" {
//                        print("IMAGEPATH\(image.value)")
//                    }
//                    if image.key == "subtitle" {
//                        print("SUBTITLE\(image.value)")
//                    }
//                }
//            }
        } else {
            self.gallery = nil
        }
        if let haveGallery = snapshotValue["haveGallery"] as? Bool {
            self.haveGallery = haveGallery
        } else {
            self.haveGallery = false
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
    
}

