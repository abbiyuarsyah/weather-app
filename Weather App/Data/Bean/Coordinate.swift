//
//  Coordinate.swift
//  Weather App
//
//  Created by Pandu Abbiyuarsyah on 15/08/18.
//  Copyright © 2018 Blanja. All rights reserved.
//

import Gloss

class Coordinate: JSONDecodable {
    
    var lon: Double?
    var lat: Double?
    
    init(){}
    
    required public init?(json: JSON) {
        self.lon = "lon" <~~ json
        self.lat = "lat" <~~ json    }
    
}
