//
//  Wind.swift
//  Weather App
//
//  Created by Pandu Abbiyuarsyah on 14/08/18.
//  Copyright © 2018 Blanja. All rights reserved.
//

import Gloss

class Wind: JSONDecodable {
    
    var speed: Double?
    var dg: Int?
    
    init(){}
    
    required public init?(json: JSON) {
        self.speed = "speed" <~~ json
        self.dg = "dg" <~~ json
    }
    
}
