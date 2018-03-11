//
//  CalculatorTableViewController.swift
//  Turbine
//
//  Created by Mariana Meireles on 10/03/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import UIKit

class CalculatorTableViewController: UITableViewController {
    
    var addresses = ["http://www.save-score.com", "http://www.respscore.com"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Calculator"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.tableView.separatorStyle = .none
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.addresses.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Calculator") as? CalcullatorCell else { return UITableViewCell() }
        let webAddresses = self.addresses[indexPath.row]
        cell.websiteLabel.text = webAddresses
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let websitelVC = mainStoryBoard.instantiateViewController(withIdentifier: "Website") as! WebViewController
        websitelVC.webSite = addresses[indexPath.row]
        self.navigationController?.pushViewController(websitelVC, animated: true)
    }

}
