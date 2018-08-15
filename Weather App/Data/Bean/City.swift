//
//  City.swift
//  Weather App
//
//  Created by Pandu Abbiyuarsyah on 14/08/18.
//  Copyright © 2018 Blanja. All rights reserved.
//

import Gloss

class City: JSONDecodable {
    
    var id: Int?
    var name: String?
    var country: String?
    
    init(){}
    
    required public init?(json: JSON) {
        self.id = "id" <~~ json
        self.name = "name" <~~ json
        self.country = "country" <~~ json
    }
    
}
