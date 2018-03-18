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
    var imagesFromPrevious = [[String:String]]()
    private var image = UIImage()
    private var imagePath: String!
    private var subtitle: String!
    var imagesPath = [String]()
    
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
            if image.key == "imagePath" {
                self.imagePath = image.value
            }
            if image.key == "subtitle" {
                self.subtitle = image.value
            }
        }
        self.imageView.sd_setImage(with: URL(string: self.imagePath), completed: { [weak self] (image, error, cacheType, imageURL) in
            self?.image = image!
            self?.imageView.image = image
        })
    }
    
    private func setTextLabel() {
        self.imageCaption.text = self.subtitle
        self.imageCaption.sizeToFit()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.imagesFromPrevious.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ImageGalleryDetailCollectionViewCell
        let imageURL = self.imagesPath[indexPath.row]
        cell.imageView.sd_setImage(with: URL(string: imageURL))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.imageSelected = imagesFromPrevious[indexPath.row]
        setImage()
        setImageViewHeight()
        setTextLabel()
    }
    
}

