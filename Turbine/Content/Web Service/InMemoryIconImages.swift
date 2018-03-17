//
//  InMemoryIconImages.swift
//  Turbine
//
//  Created by Mariana Meireles on 17/03/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import Foundation

class InMemoryIconImages: RetrieveIconImages {
    
    func fetchImages() -> [IconImages] {
        return [
            IconImages(iconImage1: "fluxogramaSquare", iconImage2: "fluxogramaRound"),
            IconImages(iconImage1: "definicoesSquare", iconImage2: "definicoesRound"),
            IconImages(iconImage1: "indicacoesSquare", iconImage2: "indicacoesRound"),
            IconImages(iconImage1: "cuidadosPreSquare", iconImage2: "cuidadosPreRound"),
            IconImages(iconImage1: "manejoSquare", iconImage2: "manejoRound"),
            IconImages(iconImage1: "cuidadosPosSquare", iconImage2: "cuidadosPosRound"),
            IconImages(iconImage1: "complicacoesSquare", iconImage2: "complicacoesRound"),
            IconImages(iconImage1: "calculadorasSquare", iconImage2: "calculadorasRound")
        ]
    }
    
}
