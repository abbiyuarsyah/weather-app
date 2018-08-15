//
//  Sys.swift
//  Weather App
//
//  Created by Pandu Abbiyuarsyah on 14/08/18.
//  Copyright © 2018 Blanja. All rights reserved.
//

import Gloss

class Sys: JSONDecodable {
    
    var id: Int?
    var message: Int?
    var country: String?
    
    init(){}
    
    required public init?(json: JSON) {
        self.id = "id" <~~ json
        self.message = "message" <~~ json
        self.country = "country" <~~ json
    }
    
    
}
