//
//  Weather.swift
//  Weather App
//
//  Created by Pandu Abbiyuarsyah on 14/08/18.
//  Copyright © 2018 Blanja. All rights reserved.
//

import Gloss

class Weather: JSONDecodable {
    
    var id: Int?
    var main: String?
    var description: String?
    var icon: String?
    
    init(){}
    
    required public init?(json: JSON) {
        self.id = "id" <~~ json
        self.main = "main" <~~ json
        self.description = "description" <~~ json
        self.icon = "icon" <~~ json
    }
    
}
