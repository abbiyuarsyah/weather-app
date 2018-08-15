//
//  Main.swift
//  Weather App
//
//  Created by Pandu Abbiyuarsyah on 14/08/18.
//  Copyright © 2018 Blanja. All rights reserved.
//

import Gloss

class Main: JSONDecodable {
    
    var temp: Double?
    var humidity: Double?
    var tempMin: Double?
    var tempMax: Double?
    
    init(){}
    
    required public init?(json: JSON) {
        self.temp = "temp" <~~ json
        self.humidity = "humidity" <~~ json
        self.tempMin = "temp_min" <~~ json
        self.tempMax = "temp_max" <~~ json

    }
}
