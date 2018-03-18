//
//  File.swift
//  Turbine
//
//  Created by Mariana Meireles on 18/03/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct ImageTest {
    
    let key: String!
    let url: String!
    let itemRef: DatabaseReference?
    
    init(key: String, url: String) {
        self.key = key
        self.url = url
        self.itemRef = nil
    }
    
    init(snapshot: DataSnapshot){
        self.key = snapshot.key
        self.itemRef = snapshot.ref
        
        let snapshotValue = snapshot.value as! NSDictionary
        
        if let imageUrl = snapshotValue["url"] as? String {
            self.url = imageUrl
        } else {
            url = ""
        }
        
    }
    
}
