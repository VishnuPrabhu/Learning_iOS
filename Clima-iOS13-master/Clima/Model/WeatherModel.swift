//
//  WeatherModel.swift
//  Clima
//
//  Created by veneq7 on 2/6/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    let conditionId: Int
    let temperature: Float
    let cityName: String
    
    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
    
    var conditionString: String {
        return getConditionName(conditionId)
    }
    
    func getConditionName(_ id: Int) -> String {
        switch id {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 700...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
}
