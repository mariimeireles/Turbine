//
//  DetailViewController.swift
//  Turbine
//
//  Created by Mariana Meireles on 25/02/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var galleryButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    var content: Content!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = content.title
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        setTextLabel()
        setGalleryButton()
    }
    
    private func setTextLabel() {
        textLabel.attributedText = content.text
        textLabel.sizeToFit()
    }
    
    private func setGalleryButton() {
        if !content.haveGallery! {
            galleryButton.alpha = 0
            let margins = view.layoutMarginsGuide
            scrollView.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GallerySegue"{
            let galleryVC = segue.destination as! GalleryCollectionViewController
            galleryVC.content = self.content
        }
    }
    
}

