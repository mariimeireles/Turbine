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
    private var imagesPath = [String]()
    private var gallery = [[String:String]]()
    var content: Content!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Imagens em Indicações"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        customImageFlowLayout = CustomImageFlowLayout()
        self.collectionView!.collectionViewLayout = customImageFlowLayout
        customImageFlowLayout.headerReferenceSize = CGSize(width: collectionView!.frame.width, height: 100)
        customImageFlowLayout.footerReferenceSize = CGSize(width: collectionView!.frame.width, height: 200)
        loadImages()
        DispatchQueue.main.async {
            self.collectionView!.reloadData()
        }
    }
    
    private func loadImages() {
        let gallery = content.gallery
        self.gallery = gallery!
        for item in gallery! {
            for image in item {
                self.imagesPath.append(image.key)
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.imagesPath.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ImageCollectionViewCell
        let imageName = self.imagesPath[indexPath.row]
        cell.imageView.image = UIImage(named: imageName)
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
        galleryDetailVC.imageSelected = content.gallery![indexPath.row]
        galleryDetailVC.imagesFromGallery = gallery
        print("Images From Previous \(gallery)")
        galleryDetailVC.imagesPath = imagesPath
        print("Images Path \(imagesPath)")
        self.navigationController?.pushViewController(galleryDetailVC, animated: true)
    }


}
