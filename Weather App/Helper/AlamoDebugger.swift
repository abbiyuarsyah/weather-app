//
//  AlamoDebugger.swift
//  Weather App
//
//  Created by Pandu Abbiyuarsyah on 14/08/18.
//  Copyright © 2018 Blanja. All rights reserved.
//

import Alamofire

extension Request {
    public func debugLog() -> Self {
        #if DEBUG
        debugPrint("API Name ::::::::::::::::::",self.request!.url!.absoluteString,terminator: "\n\n")
        debugPrint(self)
        debugPrint(terminator:"\n\n")
        #endif
        return self
    }
}
