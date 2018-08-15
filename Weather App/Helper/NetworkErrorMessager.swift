//
//  NetworkErrorMessager.swift
//  Weather App
//
//  Created by Pandu Abbiyuarsyah on 14/08/18.
//  Copyright © 2018 Blanja. All rights reserved.
//

import Alamofire
import Gloss

class NetworkErrorHandler {
    
    static public func getMessage(error: Error, rawResponse: Data?) -> String? {
        var errorMessage: String?
        
        if let error = error as? AFError {
            switch error {
                // error happened when parsing json to array.
            // maybe there's response code & info (indicate problem happened with the request)
            case .responseSerializationFailed(_):
                // check if data can't be parsed to json
                guard let data = rawResponse, let maybeJson = mapJSON(data) as? JSON else {
                    // it means data can't be parsed, got a problem !
                    print("🔥 rawResponse null? \(rawResponse == nil)... content: \(String(describing: rawResponse))")
                    errorMessage =  "Terdapat masalah (01)"
                    return errorMessage
                }
                // parse to generic response
                let genericResp = GenericResp(json: maybeJson)
                errorMessage =  getMessage(response: genericResp)
            default:
                errorMessage =  "Terdapat masalah (03)"
            }
        } else {
            print("\(error)")
            errorMessage = "Terdapat masalah (02)"
        }
        return errorMessage
    }
    
    static public func getMessage(response: GenericResp?) -> String {
        var errorMessage = ""
        errorMessage = "Terdapat masalah, \(response?.message?.lowercased() ?? "undefined"). (\(response?.cod ?? -1))"
        return errorMessage
    }
    
}

