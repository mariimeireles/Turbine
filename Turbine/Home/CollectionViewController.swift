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
    
    private var customIconFlowLayout: CustomIconFlowLayout!
    private var images = [UIImage]()
    private var isCalculator = true

    override func viewDidLoad() {
        super.viewDidLoad()
        setCustomNavigationBar()
        customIconFlowLayout = CustomIconFlowLayout()
        self.collectionView!.collectionViewLayout = customIconFlowLayout
        customIconFlowLayout.headerReferenceSize = CGSize(width: collectionView!.frame.width, height: 280)
        customIconFlowLayout.footerReferenceSize = CGSize(width: collectionView!.frame.width, height: 330)
        loadImages()
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
    
    private func loadImages() {
        images.append(UIImage(named: "Image1")!)
        images.append(UIImage(named: "Image1")!)
        images.append(UIImage(named: "Image1")!)
        images.append(UIImage(named: "Image1")!)
        images.append(UIImage(named: "Image1")!)
        images.append(UIImage(named: "Image1")!)
        self.collectionView!.reloadData()
    }

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
