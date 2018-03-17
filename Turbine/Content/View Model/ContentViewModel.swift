//
//  ContentViewModel.swift
//  Turbine
//
//  Created by Mariana Meireles on 17/03/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import Foundation

class ContentViewModel {
    
    var content: [Content] = [Content]()
    var iconImages: [IconImages] = [IconImages]()
    private var contentFetcher: RetrieveContent!
    private var iconsFetcher: RetrieveIconImages!
    
    init(iconsFetcher: RetrieveIconImages) {
        self.iconsFetcher = iconsFetcher
        self.iconImages = populateIconImages()!
    }
    
    func populateIconImages() -> [IconImages]? {
        return self.iconsFetcher.fetchImages()
    }

    
}
