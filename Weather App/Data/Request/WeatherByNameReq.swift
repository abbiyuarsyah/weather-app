//
//  ForecastByNameReq.swift
//  Weather App
//
//  Created by Pandu Abbiyuarsyah on 15/08/18.
//  Copyright © 2018 Blanja. All rights reserved.
//

import Gloss

class WeatherByNameReq: JSONEncodable {
    
    var q: String?
    var appId: String?
    
    init(q: String, appId: String) {
        self.q = q
        self.appId = appId
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "appid" ~~> self.appId,
            "q" ~~> self.q
            ])
    }
    

    
}
