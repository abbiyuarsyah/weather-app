//
//  List.swift
//  Weather App
//
//  Created by Pandu Abbiyuarsyah on 14/08/18.
//  Copyright © 2018 Blanja. All rights reserved.
//

import Gloss

class List: JSONDecodable {
    
    var main: Main?
    var weather: [Weather]?
    var wind: Wind?
    var date: String?
    
    init(){}
    
    required public init?(json: JSON) {
        self.main = "main" <~~ json
        self.weather = "weather" <~~ json
        self.wind = "wind" <~~ json
        self.date = "dt_txt" <~~ json
     }
    
    
}
