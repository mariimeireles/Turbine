//
//  Extensions.swift
//  Turbine
//
//  Created by Mariana Meireles on 19/03/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import UIKit

var imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    
    func loadImageUsingCacheWithUrlString(_ urlString: String) {
        print("IMAGE 0 \(String(describing: self.image))")
//        self.image = nil
        print("IMAGE 1 \(String(describing: self.image))")
        
        //check cache for image first
        if let cachedImage = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = cachedImage
            print("IMAGE 2 \(String(describing: self.image))")
            return
        }
        
        //otherwise fire off a new download
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            if error != nil {
                print(error ?? "")
                return
            }
            DispatchQueue.main.async(execute: {
                if let downloadedImage = UIImage(data: data!) {
                    imageCache.setObject(downloadedImage, forKey: urlString as AnyObject)
                    self.image = downloadedImage
                    print("IMAGE 3 \(String(describing: self.image))")
                }
            })
        }).resume()
    }
    
}

