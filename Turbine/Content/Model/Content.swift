//
//  Content.swift
//  Turbine
//
//  Created by Mariana Meireles on 16/03/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import Foundation

struct Content {
    
    let title: String
    let iconImage1: String
    let iconImage2: String
    let text: String
    let calculator: Bool
    let webSites: [String]?
    let gallery: Bool
    let galleryImages: [String]?
    
    init(title: String, iconImages: IconImages, text: String, calculator: Bool, webSites: [String]?, gallery: Bool, galleryImages: [String]?) {
        self.title = title
        self.iconImage1 = iconImages.iconImage1
        self.iconImage2 = iconImages.iconImage2
        self.text = text
        self.calculator = calculator
        self.webSites = webSites
        self.gallery = gallery
        self.galleryImages = galleryImages
    }
    
}

