//
//  MainWeatherViewController.swift
//  Weather App
//
//  Created by Pandu Abbiyuarsyah on 14/08/18.
//  Copyright © 2018 Blanja. All rights reserved.
//

import UIKit
import SDWebImage
import CoreLocation
import DropDown
import TimeZoneLocate

class MainWeatherViewController: UIViewController {

    @IBOutlet weak var imgBackground: UIImageView!
    @IBOutlet weak var labelTemp: UILabel!
    @IBOutlet weak var labelMinTemp: UILabel!
    @IBOutlet weak var labelMaxTemp: UILabel!
    @IBOutlet weak var labelCondition: UILabel!
    @IBOutlet weak var btnRefresh: UIButton!
    @IBOutlet weak var labelLocation: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelTime: UILabel!
    @IBOutlet weak var imgWeather: UIImageView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var getWeatherRequest: GetWeatherRequest?
    var getWeatherByNameRequest: GetWeatherByNameRequest?
    var latitude: String?
    var longitude: String?
    var weatherResp: WeatherResp?
    var urlImg: String?
    
    let locationManager = CLLocationManager()
    let reuseIdentifier = "goToInputCity"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLocationManager()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        UIStyle.Button.round.style(button: btnRefresh)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   private func setLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    @IBAction func btnPressed(_ sender: Any) {
        if (sender as AnyObject).tag == 0 {
            getWeatherData(long: longitude!, lat: latitude!)
        } else if (sender as AnyObject).tag == 1 {
            performSegue(withIdentifier: reuseIdentifier, sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == reuseIdentifier {
            let vc: InputCityViewController = segue.destination as! InputCityViewController
            vc.delegate = self
            vc.urlImg = urlImg
        } else  {
            
        }
    }
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            let temp = Int(weatherResp!.main!.temp! - 273.15)
            labelTemp.text = "\(temp)"
        case 1:
            let temp = Int(weatherResp!.main!.temp! * 1.8 - 459.67)
            labelTemp.text = "\(temp)"
        default:
            break
        }
    }
    
    private func getWeatherData(long: String, lat: String){
        Dialog.showProgressDialog(info: "Loading")
        if getWeatherRequest == nil {
            getWeatherRequest = GetWeatherRequest(delegate: self)
        }
        getWeatherRequest?.cancel()
        getWeatherRequest?.getDataRequest(long: long, lat: lat)
    }
    
    private func getWeatherByNameData(city: String) {
        Dialog.showProgressDialog(info: "Loading")
        if getWeatherByNameRequest == nil {
            getWeatherByNameRequest = GetWeatherByNameRequest(delegate: self)
        }
        getWeatherByNameRequest?.cancel()
        getWeatherByNameRequest?.getDataRequest(city: city)
    }
    
    func parseWeatherData(data: WeatherResp) {
        // code error from API is not consistent
        if data.cod != nil {
            let temp = Int(data.main!.temp! - 273.15)
            labelTemp.text = "\(temp)"
            
            let tempMin = Int(data.main!.tempMin! - 273.15)
            labelMinTemp.text = "Min: \(tempMin)°"
            
            let tempMax = Int(data.main!.tempMax! - 273.15)
            labelMaxTemp.text = "Max: \(tempMax)°"
            
            labelCondition.text = data.weather![0].main
            labelLocation.text = "\(data.name!), \(data.sys!.country!)"
            
            if data.weather![0].main!.lowercased().range(of: "mist") != nil {
                imgBackground.sd_setImage(with: URL(string: Api().getImageMist()), completed: nil)
                urlImg = Api().getImageMist()
            } else if data.weather![0].main!.lowercased().range(of: "cloud") != nil {
                imgBackground.sd_setImage(with: URL(string: Api().getImageClear()), completed: nil)
                urlImg = Api().getImageClear()
            } else if data.weather![0].main!.lowercased().range(of: "rain") != nil {
                imgBackground.sd_setImage(with: URL(string: Api().getImageRain()), completed: nil)
                urlImg = Api().getImageRain()
            } else {
                // condition general for spesific Weather, because there's no detail of API's response for this condition
                imgBackground.sd_setImage(with: URL(string: Api().getImageGeneral()), completed: nil)
                urlImg = Api().getImageGeneral()
            }
            
            getDateAndTime(coord: data.coord!)
            
            imgWeather.sd_setImage(with: URL(string: "\(Api().getWeatherIcon())\(data.weather![0].icon!).png"), completed: nil)
            Dialog.dismissProgressDialog()
        } else {
            Dialog.showFailedDialog(info: data.message!)
        }
    }
    
    private func getDateAndTime(coord: Coordinate) {
        let location = CLLocation(latitude: coord.lat!, longitude: coord.lon!)
        
        location.timeZone { (tz) -> (Void) in
            guard let tz = tz else { return }
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd:MM:yyy hh:mm:ss"
            
            let timeZone = TimeZone(identifier: tz.identifier)
            
            dateFormatter.timeZone = timeZone
            print(dateFormatter.string(from: Date()))
            
            var date = Date()
            date = dateFormatter.date(from: dateFormatter.string(from: Date()))!
        
            dateFormatter.dateFormat = "HH:mm"
            let timeString = dateFormatter.string(from: date)
            self.labelTime.text = timeString
            
            dateFormatter.dateFormat = DateFormat.forCurrentDate
            let dateString = dateFormatter.string(from: date)
            self.labelDate.text = dateString
        }
    }
}

extension MainWeatherViewController: GetWeatherDelegate {
    
    func onSuccessGetWeather(data: WeatherResp) {
        weatherResp = data
        parseWeatherData(data: data)
    }
    
    func onFailedGetWeather(errorMessage: String) {
        Dialog.showFailedDialog(info: errorMessage)
    }
}

extension MainWeatherViewController: GetWeatherByNameDelegate {
    
    func onSuccessWeatherByName(data: WeatherResp) {
        parseWeatherData(data: data)
    }
    
    func onFailedWeatherByName(errorMessage: String) {
        Dialog.showFailedDialog(info: errorMessage)
    }
}

extension MainWeatherViewController: ChangeCityDelegate {
    
    func userEnteredANewCityName(city: String) {
        getWeatherByNameData(city: city)
    }
}

extension MainWeatherViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[locations.count - 1]
        if location.horizontalAccuracy > 0 {
            self.locationManager.stopUpdatingLocation()
        
            latitude = String(location.coordinate.latitude)
            longitude = String(location.coordinate.longitude)
            
            getWeatherData(long: longitude!, lat: latitude!)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        Dialog.showFailedDialog(info: "Location Unavailable")
    }
    
    
}
