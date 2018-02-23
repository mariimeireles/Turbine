//
//  CollectionViewController.swift
//  Turbine
//
//  Created by Mariana Meireles | Stone on 2/23/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Icon"

class CollectionViewController: UICollectionViewController {
    
    var customIconFlowLayout: CustomIconFlowLayout!
    var images = [UIImage]()

    override func viewDidLoad() {
        super.viewDidLoad()
        customIconFlowLayout = CustomIconFlowLayout()
        self.collectionView!.collectionViewLayout = customIconFlowLayout
        customIconFlowLayout.headerReferenceSize = CGSize(width: collectionView!.frame.width, height: 330)
        customIconFlowLayout.footerReferenceSize = CGSize(width: collectionView!.frame.width, height: 330)
        loadImages()
    }
    
    func loadImages() {
        images.append(UIImage(named: "Image1")!)
        images.append(UIImage(named: "Image1")!)
        images.append(UIImage(named: "Image1")!)
        images.append(UIImage(named: "Image1")!)
        images.append(UIImage(named: "Image1")!)
        images.append(UIImage(named: "Image1")!)
        self.collectionView!.reloadData()
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! IconCollectionViewCell
        let image = images[indexPath.row]
        cell.imageView.image = image
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView,viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionElementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HomeHeaderView", for: indexPath) as! HomeHeaderView
            return headerView
        case UICollectionElementKindSectionFooter:
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HomeFooterView", for: indexPath) as! HomeFooterView
            footerView.referencesButton.layer.borderWidth = 2
            footerView.referencesButton.layer.borderColor = UIColor.black.cgColor
            return footerView
        default:
            assert(false, "Unexpected element kind")
        }
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
