//
//  DayForecast.swift
//  WeatherApp
//
//  Created by Олег on 25.10.2019.
//  Copyright © 2019 Олег. All rights reserved.
//

import Foundation


struct DayForecast: Identifiable{
    var id = UUID()
    
    var hours: [HourForecast] = []
}
