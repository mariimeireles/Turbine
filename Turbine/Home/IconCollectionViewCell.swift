//
//  IconCollectionViewCell.swift
//  Turbine
//
//  Created by Mariana Meireles on 18/02/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import UIKit

class IconCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imageView.image = nil
    }
}
