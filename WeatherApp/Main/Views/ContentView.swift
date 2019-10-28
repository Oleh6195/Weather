//
//  ContentView.swift
//  WeatherApp
//
//  Created by Олег on 25.10.2019.
//  Copyright © 2019 Олег. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var weather: WeatherListViewModel = WeatherListViewModel()
    
    var body: some View {
        List(weather.forecast) { item in
            HStack {
                ForEach(item.hours) { el in
                    VStack {
                        Image(el.weather[0].icon)
                        Text(String(Int(round(el.main.temp_max))))
                    }
                    .frame(width: 47, height: 65, alignment: .bottom)
                }
            }

        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
