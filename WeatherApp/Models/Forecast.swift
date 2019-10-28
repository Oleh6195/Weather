//
//  Forecast.swift
//  Weather
//
//  Created by Олег on 24.10.2019.
//  Copyright © 2019 Олег. All rights reserved.
//

import Foundation

struct Forecast{
    var weather: [HourForecast]
//    init(days: [HourForecast]) {
//        self.weather = days
//    }
    
    enum CodingKeys: String, CodingKey {
        case weather = "list"
    }
}

extension Forecast: Decodable{
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.weather = try container.decode([HourForecast].self, forKey: .weather)
    }
}
