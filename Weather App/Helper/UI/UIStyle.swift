//
//  UIStyle.swift
//  Weather App
//
//  Created by Pandu Abbiyuarsyah on 14/08/18.
//  Copyright © 2018 Blanja. All rights reserved.
//

import Gloss

class UIStyle {
    
    enum Button {
    
        case roundWhite
        case round

        func style(button: UIButton) {
            switch self {
            case .roundWhite:
                button.backgroundColor = .clear
                button.layer.cornerRadius = 2
                button.layer.borderWidth = 1
                button.layer.borderColor = UIColor.white.cgColor
            case .round:
                button.layer.cornerRadius = 2
                button.layer.borderWidth = 1
                button.layer.borderColor = UIColor.white.cgColor
            }
        }
    }
}
