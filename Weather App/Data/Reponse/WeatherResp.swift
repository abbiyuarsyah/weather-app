//
//  WeatherResp.swift
//  Weather App
//
//  Created by Pandu Abbiyuarsyah on 14/08/18.
//  Copyright © 2018 Blanja. All rights reserved.
//

import Gloss

public class WeatherResp: GenericResp {
    
    var id: Int?
    var name: String?
    var weather: [Weather]?
    var main: Main?
    var wind: Wind?
    var sys: Sys?
    var coord: Coordinate?
    
    override init(){
        super.init()
    }
    
    required public init?(json: JSON) {
        super.init(json: json)
        self.id = "id" <~~ json
        self.name = "name" <~~ json
        self.weather = "weather" <~~ json
        self.main = "main" <~~ json
        self.wind = "wind" <~~ json
        self.sys = "sys" <~~ json
        self.coord = "coord" <~~ json
    }
}
