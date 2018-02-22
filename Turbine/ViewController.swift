//
//  ViewController.swift
//  Turbine
//
//  Created by Mariana Meireles on 17/02/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {

    @IBOutlet weak var iconsCollection: UICollectionView!
    var customIconFlowLayout: CustomIconFlowLayout!
    var images = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        iconsCollection.register(UICollectionView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "Bottom")
        customIconFlowLayout = CustomIconFlowLayout()
        customIconFlowLayout.footerReferenceSize = CGSize(width: 300, height: 330)
        iconsCollection.collectionViewLayout = customIconFlowLayout
        loadImages()

    }
    
    func loadImages() {
        images.append(UIImage(named: "Image1")!)
        images.append(UIImage(named: "Image1")!)
        images.append(UIImage(named: "Image1")!)
        images.append(UIImage(named: "Image1")!)
        images.append(UIImage(named: "Image1")!)
        images.append(UIImage(named: "Image1")!)
        self.iconsCollection.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! IconCollectionViewCell
        let image = images[indexPath.row]
        cell.imageView.image = image
        return cell
    }
    
    private func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: IndexPath) -> UICollectionReusableView {

        let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "Bottom", for: indexPath) as! HomeFooterView
        footerView.backgroundColor = .green
        return footerView
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//
//        return CGSize(width: collectionview.bounds.width, height: 100)
//    }
    
    
    
    
    
    
    

}

