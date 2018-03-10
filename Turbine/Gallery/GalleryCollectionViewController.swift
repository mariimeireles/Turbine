//
//  GalleryCollectionViewController.swift
//  Turbine
//
//  Created by Mariana Meireles on 10/03/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Image"

class GalleryCollectionViewController: UICollectionViewController {
    
    private var customImageFlowLayout: CustomImageFlowLayout!
    private var images = [UIImage]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Imagens em Indicações"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        customImageFlowLayout = CustomImageFlowLayout()
        self.collectionView!.collectionViewLayout = customImageFlowLayout
        customImageFlowLayout.headerReferenceSize = CGSize(width: collectionView!.frame.width, height: 100)
        customImageFlowLayout.footerReferenceSize = CGSize(width: collectionView!.frame.width, height: 200)
        loadImages()
    }
    
    
    private func loadImages() {
        images.append(UIImage(named: "Image1")!)
        images.append(UIImage(named: "Image2")!)
        images.append(UIImage(named: "Image3")!)
        images.append(UIImage(named: "Image1")!)
        images.append(UIImage(named: "Image2")!)
        images.append(UIImage(named: "Image3")!)
        images.append(UIImage(named: "Image1")!)
        images.append(UIImage(named: "Image2")!)
        images.append(UIImage(named: "Image3")!)
        images.append(UIImage(named: "Image1")!)
        images.append(UIImage(named: "Image2")!)
        images.append(UIImage(named: "Image3")!)
        images.append(UIImage(named: "Image1")!)
        images.append(UIImage(named: "Image2")!)
        images.append(UIImage(named: "Image3")!)
        images.append(UIImage(named: "Image1")!)
        images.append(UIImage(named: "Image2")!)
        images.append(UIImage(named: "Image3")!)
        images.append(UIImage(named: "Image1")!)
        images.append(UIImage(named: "Image2")!)
        images.append(UIImage(named: "Image3")!)
        images.append(UIImage(named: "Image1")!)
        images.append(UIImage(named: "Image2")!)
        self.collectionView!.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ImageCollectionViewCell
        let image = images[indexPath.row]
        cell.imageView.image = image
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView,viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionElementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "GalleryHeaderView", for: indexPath) as! GalleryHeaderView
            return headerView
        case UICollectionElementKindSectionFooter:
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "GalleryeFooterView", for: indexPath) as! GalleryeFooterView
            footerView.rightsLabel.text = "Developed by ELSO Latin America\nin colaboration with Américas Medical Group.\nAll rights reserved © 2018"
            footerView.rightsLabel.sizeToFit()
            return footerView
        default:
            assert(false, "Unexpected element kind")
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let galleryDetailVC = mainStoryBoard.instantiateViewController(withIdentifier: "GalleryDetail") as! GalleryDetailViewController
        galleryDetailVC.image = images[indexPath.row]
        self.navigationController?.pushViewController(galleryDetailVC, animated: true)
    }


}
