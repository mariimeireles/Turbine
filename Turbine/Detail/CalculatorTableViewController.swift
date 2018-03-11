//
//  CalculatorTableViewController.swift
//  Turbine
//
//  Created by Mariana Meireles on 10/03/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import UIKit

class CalculatorTableViewController: UITableViewController {
    
    let addresses = ["www.save-score.com", "www.respscore.com"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Calculator"
        self.tableView.separatorStyle = .none
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.addresses.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Calculator") as? CalcullatorCell else { return UITableViewCell() }
        let webAddresses = addresses[indexPath.row]
        cell.websiteLabel.setTitle(webAddresses, for: .normal)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

}
