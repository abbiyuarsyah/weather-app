//
//  WeatherReq.swift
//  Weather App
//
//  Created by Pandu Abbiyuarsyah on 14/08/18.
//  Copyright © 2018 Blanja. All rights reserved.
//

import Gloss

class WeatherReq: JSONEncodable {

    var lat: String?
    var lon: String?
    var appId: String?

    init(lon: String, lat: String, appId: String) {
        self.lon = lon
        self.lat = lat
        self.appId = appId
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "appid" ~~> self.appId,
            "lat" ~~> self.lat,
            "lon" ~~> self.lon
            ])
    }
    
}
