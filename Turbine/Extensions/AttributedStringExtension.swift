//
//  AttributedStringExtension.swift
//  Turbine
//
//  Created by Mariana Meireles | Stone on 20/03/18.
//  Copyright © 2018 Mariana Meireles. All rights reserved.
//

import Foundation
import UIKit

extension NSMutableAttributedString {
    @discardableResult func bold(_ text: String) -> NSMutableAttributedString {
        let attributes: [NSAttributedStringKey: Any] = [.font: UIFont(name: "Roboto-Bold", size: 17)!]
        let boldString = NSMutableAttributedString(string: text, attributes: attributes)
        append(boldString)
        
        return self
    }
    
    @discardableResult func normal(_ text: String) -> NSMutableAttributedString {
        let attributes: [NSAttributedStringKey: Any] = [.font: UIFont(name: "Roboto-Regular", size: 17)!]
        let normal = NSMutableAttributedString(string: text, attributes: attributes)
        append(normal)
        
        return self
    }
    
    @discardableResult func boldItalic(_ text: String) -> NSMutableAttributedString {
        let attributes: [NSAttributedStringKey: Any] = [.font: UIFont(name: "Roboto-BoldItalic", size: 17)!]
        let boldItalic = NSMutableAttributedString(string: text, attributes: attributes)
        append(boldItalic)
        
        return self
    }
    
    @discardableResult func italic(_ text: String) -> NSMutableAttributedString {
        let attributes: [NSAttributedStringKey: Any] = [.font: UIFont(name: "Roboto-Italic", size: 17)!]
        let normal = NSMutableAttributedString(string: text, attributes: attributes)
        append(normal)
        
        return self
    }
}
