//
//  ContentViewModel.swift
//  Turbine
//
//  Created by Mariana Meireles on 20/03/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import Foundation

class ContentViewModel {
    
    var content: [Content] = [Content]()
    private var contentFetcher: RetrieveContent!
    
    init(fetcher: RetrieveContent) {
        self.contentFetcher = fetcher
        content = populateContent()!
    }
    
    func populateContent() -> [Content]? {
        return self.contentFetcher.fetchContent()
    }
    
}
