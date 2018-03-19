//
//  CollectionViewController.swift
//  Turbine
//
//  Created by Mariana Meireles | Stone on 2/23/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase

private let reuseIdentifier = "Icon"

class CollectionViewController: UICollectionViewController {
    
    private var customIconFlowLayout: CustomIconFlowLayout!
    private var contents = [Content]()
    private var firebaseRef: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCustomNavigationBar()
        collectionViewLayout()
        self.firebaseRef = Database.database().reference().child("Content")
//        loadContent()
        fetchContent()
    }
    
//    private func loadContent() {
//        self.firebaseRef = Database.database().reference().child("Content")
//        self.firebaseRef.database.isPersistenceEnabled = true
//        self.firebaseRef.keepSynced(true)
//        self.firebaseRef.observe(DataEventType.value, with: { (snapshot) in
//            var newContents = [Content]()
//            for contentSnapshot in snapshot.children {
//                let contentObject = Content(snapshot: contentSnapshot as! DataSnapshot)
//                newContents.append(contentObject)
//            }
//            self.contents = newContents
//            DispatchQueue.main.async {
//                self.collectionView!.reloadData()
//            }
//        })
//    }
    
    func fetchContent() {
//        self.firebaseRef = Database.database().reference().child("Content")
//        Database.database().isPersistenceEnabled = true
//        Database.database().reference().child("Content").observe(.childAdded, with: { (snapshot) in
//        self.firebaseRef.keepSynced(true)
        self.firebaseRef.observe(.childAdded, with: { (snapshot) in
            if let dictionary = snapshot.value as? [String: AnyObject] {
                let content = Content(dictionary: dictionary)
//                let user = User(dictionary: dictionary)
//                user.id = snapshot.key
                self.contents.append(content)
                self.firebaseRef.keepSynced(true)
                DispatchQueue.main.async(execute: {
                    self.collectionView!.reloadData()
                })
//                user.name = dictionary["name"]
            }

        }, withCancel: nil)
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
        return self.contents.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! IconCollectionViewCell
        let content = self.contents[indexPath.row]
        if let iconImage1 = content.iconImage1 {
            cell.imageView.loadImageUsingCacheWithUrlString(iconImage1)
        }
//        cell.imageView.sd_setImage(with: URL(string: content.iconImage1))

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
        let selectedContent = contents[indexPath.row]
        let isCalculator = selectedContent.calculator
        if isCalculator! {
            let calculatorVC = mainStoryBoard.instantiateViewController(withIdentifier: "Calculator") as! CalculatorViewController
            calculatorVC.content = selectedContent
            self.navigationController?.pushViewController(calculatorVC, animated: true)

        } else {
            let detailVC = mainStoryBoard.instantiateViewController(withIdentifier: "Detail") as! DetailViewController
            detailVC.content = selectedContent
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
    }

}
