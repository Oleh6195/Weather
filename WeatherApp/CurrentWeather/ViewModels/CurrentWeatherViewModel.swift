//
//  CurrentWeatherViewModel.swift
//  WeatherApp
//
//  Created by Олег on 29.10.2019.
//  Copyright © 2019 Олег. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

final class CurrentWeatherViewModel: ObservableObject{

    @Published var currentWeather: CurrentWeatherModel?{
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
        CurrentWeatherRepository.shared.loadCurrentWeather(city: "Lviv", apiKey: "669faae0776c30d4412765bf4439aa4c") { (forecast) in
            self.currentWeather = forecast
        }
    }
    
    let objectWillChange = PassthroughSubject<CurrentWeatherViewModel,Never>()
    
    
}
