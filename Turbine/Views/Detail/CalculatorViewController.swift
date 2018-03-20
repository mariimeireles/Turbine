//
//  CalculatorViewController.swift
//  Turbine
//
//  Created by Mariana Meireles on 18/03/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import UIKit
import SafariServices

class CalculatorViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SFSafariViewControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    var content: Content!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = content.title
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.tableView.separatorStyle = .none
        setIconImage()
    }
    
    private func setIconImage() {
        let imageName = self.content.iconImage2
        imageView.image = UIImage(named: imageName)
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.layer.masksToBounds = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.content.webSites?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Calculator") as? CalcullatorCell else { return UITableViewCell() }
        let webAddresses = self.content.webSites![indexPath.row]
        cell.websiteLabel.text = webAddresses
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let webSite = self.content.webSites![indexPath.row]
        let url = URL(string: webSite)!
        let vc = SFSafariViewController(url: url)
        vc.delegate = self
        present(vc, animated: true)
    }

}
