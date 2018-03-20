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
    var imageSelected = [String:String]()
    var imagesFromGallery = [[String:String]]()
    var imagesPath = [String]()
    private var image = UIImage()
    private var imagePath: String!
    private var subtitle: String!
    
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
        for image in imageSelected {
            self.imagePath = image.key
            self.subtitle = image.value
        }
        self.image = UIImage(named: self.imagePath)!
        self.imageView.image = self.image
    }
    
    private func setTextLabel() {
        self.imageCaption.text = self.subtitle
        self.imageCaption.sizeToFit()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.imagesFromGallery.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ImageGalleryDetailCollectionViewCell
        let imageName = self.imagesPath[indexPath.row]
        cell.imageView.image = UIImage(named: imageName)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.imageSelected = imagesFromGallery[indexPath.row]
        setImage()
        setImageViewHeight()
        setTextLabel()
    }
    
}

