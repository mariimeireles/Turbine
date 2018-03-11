//
//  GalleryDetailViewController.swift
//  Turbine
//
//  Created by Mariana Meireles on 10/03/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ImageGalleryDetailCell"

class GalleryDetailViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var imageViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageCaption: UILabel!
    var image = UIImage()
    var images = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Galeria de Imagens"
        setImage()
        setTextLabel()
        setImageViewHeight()
    }
    
    private func setImageViewHeight() {
        let imageWidth = image.size.width
        let imageHeight = image.size.height
        let viewWidth = self.view.frame.width
        let ratio = viewWidth/imageWidth
        let scaledHeight = imageHeight * ratio
        imageViewConstraint.constant = scaledHeight
    }
    
    private func setImage() {
        self.imageView.image = image
    }
    
    private func setTextLabel() {
        self.imageCaption.text = "Fabian TC, Patton JH Jr. Croce MA, et al. Blunt Carotid arterial injuries: Importance of early diagnosis and anticoagulant therapy. An Surg 196; 23:513."
        self.imageCaption.sizeToFit()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ImageGalleryDetailCollectionViewCell
        let image = images[indexPath.row]
        cell.imageView.image = image
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.image = images[indexPath.row]
        setImage()
        setImageViewHeight()
    }
    
}

