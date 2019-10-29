//
//  HourForecast.swift
//  Weather
//
//  Created by Олег on 24.10.2019.
//  Copyright © 2019 Олег. All rights reserved.
//

import Foundation

struct MainWeatherData{
    var temp_min: Float
    var temp_max: Float
    var pressure: Float
    var humidity: Float
    
    enum CodingKeys: String, CodingKey {
        case temp_min
        case temp_max
        case pressure
        case humidity
    }
}
extension MainWeatherData: Decodable{
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.temp_min = try container.decode(Float.self, forKey: .temp_min)
        self.temp_max = try container.decode(Float.self, forKey: .temp_max)
        self.pressure = try container.decode(Float.self, forKey: .pressure)
        self.humidity = try container.decode(Float.self, forKey: .humidity)
    }
}


struct HourForecast: Identifiable {
    let id = UUID()
    var main: MainWeatherData
    var weather: [Weather]
    var wind: Wind
    var time: DateComponents
    
    enum CodingKeys: String, CodingKey {
        case main
        case weather
        case wind
        case time = "dt_txt"
    }

}
extension HourForecast: Decodable{
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.main = try container.decode(MainWeatherData.self, forKey: .main)
        self.weather = try container.decode([Weather].self, forKey: .weather)
        self.wind = try container.decode(Wind.self, forKey: .wind)
        let t = try container.decode(String.self, forKey: .time)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd' 'HH:mm:ss"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        let calendar = Calendar.current
        self.time = calendar.dateComponents([.year, .month, .day, .hour], from: dateFormatter.date(from:t)!)

    }
}



