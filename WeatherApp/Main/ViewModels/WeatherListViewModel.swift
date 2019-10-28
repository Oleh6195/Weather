//
//  WeatherListViewModel.swift
//  WeatherApp
//
//  Created by Олег on 25.10.2019.
//  Copyright © 2019 Олег. All rights reserved.
//

import Foundation
import Combine
import SwiftUI


final class WeatherListViewModel: ObservableObject{

    @Published var forecast: [DayForecast] = []{
        didSet{
            DispatchQueue.main.async {
                self.objectWillChange.send(self)
            }
        }
    }
    init() {
        fetchWeather()
    }
    
    func fetchWeather(){
        WeatherLoader.shared.load(city: "Lviv", apiKey: "669faae0776c30d4412765bf4439aa4c") { (forecast) in
            self.forecast = forecast
        }
    }
    
    let objectWillChange = PassthroughSubject<WeatherListViewModel,Never>()
    
    
}
