//
//  GenericResp.swift
//  Weather App
//
//  Created by Pandu Abbiyuarsyah on 14/08/18.
//  Copyright © 2018 Blanja. All rights reserved.
//

import Gloss

public class GenericResp: JSONDecodable {
    
    var cod: Int?
    var message: String?
    
    init(){}
    
    // MARK: - Deserialization
    required public init?(json: JSON) {
        self.cod = "cod" <~~ json
        self.message = "message" <~~ json
    }
    
    
}
