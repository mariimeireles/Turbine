//
//  Content.swift
//  Turbine
//
//  Created by Mariana Meireles on 16/03/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import Foundation

struct Content {
    
    let calculator: Bool
    let gallery: [String]?
    let haveGallery: Bool
    let iconImage1: String
    let iconImage2: String
    let text: String?
    let title: String
    let webSites: [String]?
    
    init(calculator: Bool, gallery: [String]?, haveGallery: Bool, iconImages: IconImages, text: String?, title: String, webSites: [String]?) {
        
        self.calculator = calculator
        self.gallery = gallery
        self.haveGallery = haveGallery
        self.iconImage1 = iconImages.iconImage1
        self.iconImage2 = iconImages.iconImage2
        self.text = text
        self.title = title
        self.webSites = webSites
    }
    
}

