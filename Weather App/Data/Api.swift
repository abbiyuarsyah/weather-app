//
//  Service.swift
//  Weather App
//
//  Created by Pandu Abbiyuarsyah on 14/08/18.
//  Copyright © 2018 Blanja. All rights reserved.
//

class Api: Service {

    func getWeatherByWeather() -> String {
        return "\(BASE_URL)weather"
    }

    func getWeatherByForecast() -> String {
        return "\(BASE_URL)forecast"
    }
    
    func getWeatherIcon() -> String {
        return "http://openweathermap.org/img/w/"
    }
    
    func getImageClear() -> String {
        return "https://images.pexels.com/photos/125457/pexels-photo-125457.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"
    }
    
    func getImageMist() -> String {
        return "https://images.pexels.com/photos/1287081/pexels-photo-1287081.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"
    }
    
    func  getImageRain() -> String {
        return "https://images.pexels.com/photos/69927/rain-floor-water-wet-69927.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=350"
    }
    
    func  getImageGeneral() -> String {
        return "https://images.pexels.com/photos/5439/earth-space.jpg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"
    }
    
}
