//
//  DetailViewController.swift
//  Turbine
//
//  Created by Mariana Meireles on 25/02/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var galleryButton: UIButton!
    var content: Content!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = content.title
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        setIconImage()
        setTextLabel()
        setGalleryButton()
    }
    
    private func setIconImage() {
        let imageName = content.iconImage2
        iconImage.image = UIImage(named: imageName)
        iconImage.layer.cornerRadius = iconImage.frame.size.width / 2
        iconImage.layer.masksToBounds = true
    }
    
    private func setTextLabel() {
        textLabel.attributedText = content.text
        textLabel.sizeToFit()
    }
    
    private func setGalleryButton() {
        if !content.haveGallery! {
            galleryButton.alpha = 0
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GallerySegue"{
            let galleryVC = segue.destination as! GalleryCollectionViewController
            galleryVC.content = self.content
        }
    }
    
}

