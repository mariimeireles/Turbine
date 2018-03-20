//
//  Content.swift
//  Turbine
//
//  Created by Mariana Meireles on 16/03/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import Foundation

struct Content {
    
    var calculator: Bool
    var gallery: [[String:String]]?
    var haveGallery: Bool?
    var iconImage1: String
    var iconImage2: String
    var text: String?
    var title: String
    var webSites: [String]?
    
    init(calculator: Bool, gallery: [[String:String]]?, haveGallery: Bool, iconImage1: String, iconImage2: String, text: String?, title: String, webSites: [String]?) {
//        self.init()
        self.calculator = calculator
        self.gallery = gallery
        self.haveGallery = haveGallery
        self.iconImage1 = iconImage1
        self.iconImage2 = iconImage2
        self.text = text
        self.title = title
        self.webSites = webSites
    }
}


