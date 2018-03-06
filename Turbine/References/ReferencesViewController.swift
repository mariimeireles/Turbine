//
//  ReferencesViewController.swift
//  Turbine
//
//  Created by Mariana Meireles on 04/03/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import UIKit

class ReferencesViewController: UIViewController {

    @IBOutlet weak var reference1Label: UILabel!
    @IBOutlet weak var reference2Label: UILabel!
    @IBOutlet weak var reference3Label: UILabel!
    @IBOutlet weak var rightsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Referências Bibliográficas"
        setTextLabel()
    }
    
    private func setTextLabel() {
        reference1Label.text = "Fabian TC, Patton JH Jr. Croce MA, et al. Blunt Carotid arterial injuries: Importance of early diagnosis and anticoagulant therapy. An Surg 196; 23:513."
        reference2Label.text = "Biffl M., Moore EE, Offner PJ, et al. Blunt carotid arterial injuries: implications of a new grading scale. L Trauma 1999; 47:845."
        reference3Label.text = "Miller PR., Fabian TC., Croce MA, et al. Prospective screening for blunt cerebrovascular injuries. Ann Slurg, 2002; 22: 234."
        rightsLabel.text = "Developed by ELSO Latin America\nin colaboration with Américas Medical Group.\nAll rights reserved © 2018"
        reference1Label.sizeToFit()
        reference2Label.sizeToFit()
        reference3Label.sizeToFit()
        rightsLabel.sizeToFit()
    }

}
