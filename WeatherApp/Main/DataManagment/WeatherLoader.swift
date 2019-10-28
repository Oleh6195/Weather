//
//  WeattherLoader.swift
//  WeatherApp
//
//  Created by Олег on 25.10.2019.
//  Copyright © 2019 Олег. All rights reserved.
//

import Foundation


class WeatherLoader{
    static let shared = WeatherLoader()
    private let decoder = JSONDecoder()
    
//    func load(city: String, apiKey:String, complettion: @escaping ([DayForecast]) -> ()){
//        var forecast: [DayForecast] = []
//        let urlString = "https://api.openweathermap.org/data/2.5/forecast?q=\(city)&units=metric&appid=\(apiKey)"
//        print(urlString)
//        if let url = URL(string: urlString){
//            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//                if let d = data, d.count > 0 {
//                    if let w = try? self.decoder.decode(Forecast.self, from: d){
//                        var day = w.weather[0].time.day
//                        var dayForecast: DayForecast = DayForecast()
//                        for item in w.weather{
//                            if item.time.day == day{
//                                dayForecast.hours.append(item)
//                            }else{
//                                day = item.time.day
//                                forecast.append(dayForecast)
//                                dayForecast = .init()
//                            }
//                        }
//                        forecast.append(dayForecast)
//                        print(forecast)
//                        complettion(forecast)
//                    }
//                }
//            }
//            task.resume()
//        }
//    }
    func load(city: String, apiKey:String, complettion: @escaping ([DayForecast]) -> ()){
        var forecast: [DayForecast] = []
        let urlString = "https://api.openweathermap.org/data/2.5/forecast?q=\(city)&units=metric&appid=\(apiKey)"
        print(urlString)
        let data: Data
        guard let file = Bundle.main.url(forResource: "data.json", withExtension: nil) else {return}
        
        data = try! Data(contentsOf: file)
        if let w = try? self.decoder.decode(Forecast.self, from: data){
            var day = w.weather[0].time.day
            var dayForecast: DayForecast = DayForecast()
            for item in w.weather{
                if item.time.day == day{
                    dayForecast.hours.append(item)
                }else{
                    day = item.time.day
                    forecast.append(dayForecast)
                    dayForecast = .init()
                }
            }
            forecast.append(dayForecast)
            print(forecast)
            complettion(forecast)
        }
        

    }
    

}
