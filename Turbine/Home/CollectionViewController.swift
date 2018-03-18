//
//  CollectionViewController.swift
//  Turbine
//
//  Created by Mariana Meireles | Stone on 2/23/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import UIKit
import FirebaseDatabase
import SDWebImage

private let reuseIdentifier = "Icon"

class CollectionViewController: UICollectionViewController {
    
    private var customIconFlowLayout: CustomIconFlowLayout!
    private var contentViewModel: ContentViewModel!
    private var inMemoryIconImages: InMemoryIconImages!
    private var images = [UIImage]()
    
    ////////////
    private var imageTest = [ImageTest]()
    private var firebaseRef: DatabaseReference!
    ////////////
    
    private var isCalculator = true

    override func viewDidLoad() {
        super.viewDidLoad()
        setCustomNavigationBar()
        collectionViewLayout()
        settingViewModel()
        
        ////////////
        self.firebaseRef = Database.database().reference().child("images")
        loadImageTest()
        ////////////

        DispatchQueue.main.async {
            self.collectionView!.reloadData()
        }
    }
    
    ////////////
    private func loadImageTest() {
        self.firebaseRef.observe(DataEventType.value, with: { (snapshot) in
            var newImages = [ImageTest]()
            for imageTestSnapshot in snapshot.children {
                let imageTestObject = ImageTest(snapshot: imageTestSnapshot as! DataSnapshot)
                newImages.append(imageTestObject)
            }
            self.imageTest = newImages
            self.collectionView!.reloadData()
        })
    }
    ////////////
    
    private func settingViewModel() {
        self.inMemoryIconImages = InMemoryIconImages()
        self.contentViewModel = ContentViewModel(iconsFetcher: self.inMemoryIconImages)
    }
    
    private func collectionViewLayout() {
        customIconFlowLayout = CustomIconFlowLayout()
        self.collectionView!.collectionViewLayout = customIconFlowLayout
        customIconFlowLayout.headerReferenceSize = CGSize(width: collectionView!.frame.width, height: 280)
        customIconFlowLayout.footerReferenceSize = CGSize(width: collectionView!.frame.width, height: 330)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    private func setCustomNavigationBar() {
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        ////////////
//        return self.contentViewModel.iconImages.count
        return self.imageTest.count
        ////////////
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        ////////////
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! IconCollectionViewCell
//        let iconImage = self.contentViewModel.iconImages[indexPath.row]
//        cell.imageView.image = UIImage(named: iconImage.iconImage1)!
        let image = self.imageTest[indexPath.row]
        cell.imageView.sd_setImage(with: URL(string: image.url))
            //, placeholderImage: UIImage(named: "Image1"))
        return cell
        ////////////

    }
    
    override func collectionView(_ collectionView: UICollectionView,viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionElementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HomeHeaderView", for: indexPath) as! HomeHeaderView
            return headerView
        case UICollectionElementKindSectionFooter:
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HomeFooterView", for: indexPath) as! HomeFooterView
            footerView.referencesButton.layer.borderWidth = 1
            footerView.referencesButton.layer.borderColor = UIColor.black.cgColor
            footerView.rightsLabel.text = "Developed by ELSO Latin America\nin colaboration with Américas Medical Group.\nAll rights reserved © 2018"
            footerView.rightsLabel.sizeToFit()
            return footerView
        default:
            assert(false, "Unexpected element kind")
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        if isCalculator {
            let calculatorVC = mainStoryBoard.instantiateViewController(withIdentifier: "Calculator") as! CalculatorTableViewController
            self.navigationController?.pushViewController(calculatorVC, animated: true)

        } else {
            let detailVC = mainStoryBoard.instantiateViewController(withIdentifier: "Detail") as! DetailViewController
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
    }

}
