//
//  CustomIconFlowLayout.swift
//  Turbine
//
//  Created by Mariana Meireles on 18/02/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import UIKit

class CustomIconFlowLayout: UICollectionViewFlowLayout {

    override init() {
        super.init()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayout()
    }
    
    override var itemSize: CGSize {
        set{}

        get{
            let numberOfColumns: CGFloat = 2
            let number = minimumInteritemSpacing + 82
            let iconWidth = (self.collectionView!.frame.width - number) / numberOfColumns
            return CGSize(width: iconWidth, height: iconWidth)
        }
    }
    
    func setupLayout() {
        minimumInteritemSpacing = 31
        minimumLineSpacing = 31
        sectionInset = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 40)
    }
    
    
}
