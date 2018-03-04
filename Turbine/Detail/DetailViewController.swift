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
        setIconImage()
        setTextLabel()
    }
    
    private func setIconImage() {
        iconImage.image = UIImage(named: "Image1")
        iconImage.layer.cornerRadius = iconImage.frame.size.width / 2
        iconImage.layer.masksToBounds = true
    }
    
    private func setTextLabel() {
        textLabel.text = "ECMO fornece suporte de vida temporária a pacientes com insuficiência respiratória e disfunção circulatória grave, mas potencialmente reversíveis. Pode servir como tratamento fim ou ponte para tratamentos definitivos. \nPor ECMO entendemos como ExtraCorporeal Membrane Oxigenation, podendo ser utilizado um termo mais amplo e atual como ELSO, do inglês Extracorporeal Life Suport Oxigenation. Como a própria sigla explicita, um método é chamado de ECMO quando ocorre alguma troca de gases através de uma membrana,com ou sem a necessidade de uma bomba. \nConstituiu durante muito tempo a simples miniaturização dos aparelhos de circulação extra-corpórea utilizados em cirurgias cardíacas, e talvez por isso, associado a mortalidade elevada. O desenvolvimento da tecnologia de materiais, estudos de biocompatibilidade e miniaturização dos aparelhos, permitiu a sua utilização à beira leito, de forma segura, com significativa queda na mortalidade, sendo utilizada à beira leito nas unidades de terapia intensiva ao redor do mundo. \nPodemos utilizar vários modos de ECMO, que são definidos pela posição das cânulas de drenagem e de retorno: \n- Naqueles onde a cânula de drenagem é venosa e a cânula de retorno é venosa, o modo é dito veno-venoso (VV) e está reservado principalmente para as patologias pulmonares, onde a bomba cardíaca funciona de forma adequada. \n- Naqueles em que a cânula de drenagem é venosa e a cânula de retorno é arterial, o modo é dito veno-arterial (VA), reservada às disfunções primariamente circulatórias ou respiratórias com falência de bomba cardíaca. \nOutros modos constituem situações especiais e não serão tratadas especificamente por este protocolo, sendo apenas citadas nas definições, como as modalidades VAV (veno-artério-venosa – em que a cânula de drenagem é venosa e \nexistem duas cânulas de retorno, uma arterial, outra venosa), modalidades centrais que permitem as mais variadas conformações, destinadas principalmente a falências circulatórias cardíacas complexas ou complicações cirúrgicas graves, ou as chamadas ECCO2R (sigla para ExtraCorporeal CO2 Removal), caracterizadas por membranas capazes de remover CO2 sem oxigenação.\nPodemos também subclassificar o modo de ECMO conforme o sítio de inserção das cânulas escolhido: \nA. Veno-venosa (VV): Fêmuro-femural ou fêmuro-jugular, com a primeira palavra definindo a inserção cânula de drenagem e a segunda a de retorno. \nB. Veno-arterial (VA): Fêmuro-femural ou fêmuro-axilar, da mesma forma de nomenclatura que a anterior. \nAs cânulas utilizadas em ECMO são divididas em cânulas de drenagem, que aspiram o sangue do leito venoso, transportando para o circuito do ECMO; e as cânulas de retorno, que levam o sangue já oxigenado do circuito para o leito venoso ou arterial conforme a modalidade escolhida. \nO primeiro grupo de cânulas (ditas de drenagem ou “venosas”) possuem características próprias: \n- são mais longas (55 cm) - possuem múltiplos orifícios que permitem a aspiração adequada do sangue, mesmo se algum deles estiver obstruído, garantindo um bom fluxo para a utilização do método. \nJá as de retorno (também chamadas “arteriais”) possuem como caracteristicas: \nsão mais curtas (15 a 25cm) \n- orifício único de drenagem \n- possuem conexões laterais que permitem a conexão de cânulas de perfusão de membros. \nEstas características permitem um retorno adequado adequado de fluxo de sangue minimizando variações de pressão no sistema que podem ser responsáveis por algumas complicações do método. \nA exceção a esta regra é a utilização das cânulas de drenagem para realização de ECMO VV fêmuro-femural, onde excepcionalmente serão utilizadas duas cânulas de drenagem para evitar a recirculação de sangue dada a especificidade anatômica desta conformação. \nExiste, ainda indisponível em nosso meio, uma cânula única (Avalon® é a mais conhecida), destinada exclusivamente à modalidade veno-venosa, capaz de realizar o método em uma única veia. Esta cânula possui orifícios proximais e distais para drenagem de sangue e um orifício medial para retorno do sangue. Deve ser reservada a situações especiais de ECMO que, dada sua ausência no mercado nacional, não serão explicadas neste protocolo. \nA escolha das cânulas é de fundamental importância para o sucesso do método para evitarmos as complicações mais comuns, garantindo o máximo benefício para o paciente. A escolha das cânulas deve respeitar a lei de Pouiselle em que, em um resumo rápido, o fluxo é inversamente proporcional à largura da cânula e à viscosidade e diretamente proporcional à quarta potência do raio da cânula utilizada. Por essa lei, dá-se preferência sempre a cânulas mais calibrosas, sendo as de drenagem maiores que as de retorno"
        textLabel.sizeToFit()
    }

}
