//
//  GetWeatherRequest.swift
//  Weather App
//
//  Created by Pandu Abbiyuarsyah on 14/08/18.
//  Copyright © 2018 Blanja. All rights reserved.
//

import Alamofire

class GetWeatherRequest {
    
    private var delegate: GetWeatherDelegate?
    private var currentRequest: DataRequest?
    
    init(delegate: GetWeatherDelegate) {
        self.delegate = delegate
    }
    
    public func cancel() {
        currentRequest?.cancel()
        currentRequest = nil
    }
    
    public func getDataRequest(long: String, lat: String) {
        
        // cancel first
        cancel()
        
        let request = WeatherReq(lon: long, lat: lat, appId: Service().APP_ID)
        
        // doing request
        currentRequest = Alamofire
            .request(Api().getWeatherByWeather(),
                     method: .get,
                     parameters: request.toJSON())
            .debugLog()
            .responseObject(WeatherResp.self){ response in
                switch response.result {
                // it is success, data can be retrieved
                case .success(let value):
                    if value != nil {
                        self.delegate?.onSuccessGetWeather(data: value)
                    } else {
                        self.delegate?.onFailedGetWeather(errorMessage: value.message!)
                    }
                    break
                // error when doing request, maybe problem with network
                case .failure(let error):
                    if let errorMessage = NetworkErrorHandler.getMessage(error: error, rawResponse: response.data) {
                        self.delegate?.onFailedGetWeather(errorMessage: errorMessage)
                    } else {
                        self.delegate?.onFailedGetWeather(errorMessage: "Terdapat masalah (13)")
                    }
                }
        }
    }
}

public protocol GetWeatherDelegate {
    func onSuccessGetWeather(data: WeatherResp)
    func onFailedGetWeather(errorMessage: String)
}
