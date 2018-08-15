//
//  GetForecastRequest.swift
//  Weather App
//
//  Created by Pandu Abbiyuarsyah on 14/08/18.
//  Copyright © 2018 Blanja. All rights reserved.
//

import Alamofire

class GetWeatherByNameRequest {
    
    private var delegate: GetWeatherByNameDelegate?
    private var currentRequest: DataRequest?
    
    init(delegate: GetWeatherByNameDelegate) {
        self.delegate = delegate
    }
    
    public func cancel() {
        currentRequest?.cancel()
        currentRequest = nil
    }
    
    public func getDataRequest(city: String?) {
        
        // cancel first
        cancel()
        
        let request = WeatherByNameReq(q: city!, appId: Service().APP_ID)
        
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
                        self.delegate?.onSuccessWeatherByName(data: value)
                    } else {
                        self.delegate?.onFailedWeatherByName(errorMessage: value.message!)
                    }
                    break
                // error when doing request, maybe problem with network
                case .failure(let error):
                    if let errorMessage = NetworkErrorHandler.getMessage(error: error, rawResponse: response.data) {
                        self.delegate?.onFailedWeatherByName(errorMessage: errorMessage)
                    } else {
                        self.delegate?.onFailedWeatherByName(errorMessage: "Terdapat masalah (13)")
                    }
                }
        }
    }
}

public protocol GetWeatherByNameDelegate {
    func onSuccessWeatherByName(data: WeatherResp)
    func onFailedWeatherByName(errorMessage: String)
}
