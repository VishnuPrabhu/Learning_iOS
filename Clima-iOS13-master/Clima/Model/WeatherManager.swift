//
//  WeatherManager.swift
//  Clima
//
//  Created by veneq7 on 2/6/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailedWithError(error: Error)
}

struct WeatherManager {
    let weatherUrl = "http://api.openweathermap.org/data/2.5/weather?appid=3438b6c3883505fb9ae0560fa0e34c4f"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(for cityName: String) {
        let urlString = "\(weatherUrl)&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let urlString = "\(weatherUrl)&lat=\(latitude)&long=\(longitude)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        guard let url = URL(string: urlString) else {
            return print("url is error")
        }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                self.delegate?.didFailedWithError(error: error!)
                return
            }
            if let data = data, let weather = self.parseJson(data) {
                self.delegate?.didUpdateWeather(self, weather: weather)
            }
        }
        task.resume()
    }
    
    func parseJson(_ weatherData: Data) -> WeatherModel? {
        do {
            let weatherData = try JSONDecoder().decode(WeatherData.self, from: weatherData)
            let temperature = weatherData.main.temp
            let cityName = weatherData.name
            let id = weatherData.weather.first!.id
            
            let weatherModel = WeatherModel(conditionId: id, temperature: temperature, cityName: cityName)
            return weatherModel
        } catch {
            delegate?.didFailedWithError(error: error)
            return nil
        }
    }
    
}
