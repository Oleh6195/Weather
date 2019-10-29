//
//  CurrentWeatherDataManager.swift
//  WeatherApp
//
//  Created by Олег on 27.10.2019.
//  Copyright © 2019 Олег. All rights reserved.
//

import Foundation


class CurrentWeatherRepository{
    static let shared = CurrentWeatherRepository()
    private let decoder = JSONDecoder()
    
    func loadCurrentWeather(city: String, apiKey:String, complettion: @escaping (CurrentWeatherModel) -> ()){
        var forecast: [DayForecast] = []
        let urlString = "http://api.openweathermap.org/data/2.5/weather?q=\(city)&units=metric&appid=\(apiKey)"
        print(urlString)
        if let url = URL(string: urlString){
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let d = data, d.count > 0 {
                    if let w = try? self.decoder.decode(CurrentWeatherModel.self, from: d){
                        print(w)
                        complettion(w)
                    }
                }
            }
            task.resume()
        }
        

    }
}
