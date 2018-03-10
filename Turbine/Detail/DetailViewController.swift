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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Detail"
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        setIconImage()
        setTextLabel()
    }
    
    private func setIconImage() {
        iconImage.image = UIImage(named: "Image1")
        iconImage.layer.cornerRadius = iconImage.frame.size.width / 2
        iconImage.layer.masksToBounds = true

    }
    
    private func setTextLabel() {
        textLabel.text = "ECMO fornece suporte de vida temporária a pacientes com insuficiência respiratória e disfunção circulatória grave, mas potencialmente reversíveis. Pode servir como tratamento fim ou ponte para tratamentos definitivos. \nPor ECMO entendemos como ExtraCorporeal Membrane Oxigenation, podendo ser utilizado um termo mais amplo e atual como ELSO, do inglês Extracorporeal Life Suport Oxigenation. Como a própria sigla explicita, um método é chamado de ECMO quando ocorre alguma troca de gases através de uma membrana,com ou sem a necessidade de uma bomba. \nConstituiu durante muito tempo a simples miniaturização dos aparelhos de circulação extra-corpórea utilizados em cirurgias cardíacas, e talvez por isso, associado a mortalidade elevada. O desenvolvimento da tecnologia de materiais, estudos de biocompatibilidade e miniaturização dos aparelhos, permitiu a sua utilização à beira leito, de forma segura, com significativa queda na mortalidade, sendo utilizada à beira leito nas unidades de terapia intensiva ao redor do mundo. \nPodemos utilizar vários modos de ECMO, que são definidos pela posição das cânulas de drenagem e de retorno: \n- Naqueles onde a cânula de drenagem é venosa e a cânula de retorno é venosa, o modo é dito veno-venoso (VV) e está reservado principalmente para as patologias pulmonares, onde a bomba cardíaca funciona de forma adequada. \n- Naqueles em que a cânula de drenagem é venosa e a cânula de retorno é arterial, o modo é dito veno-arterial (VA), reservada às disfunções primariamente "
        textLabel.sizeToFit()
    }

}
