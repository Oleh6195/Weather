//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Олег on 29.10.2019.
//  Copyright © 2019 Олег. All rights reserved.
//

import Foundation


struct CurrentWeatherModel: Decodable {
    var weather: [Weather]
    var main: MainWeatherData
    var wind: Wind
    var name: String

}


