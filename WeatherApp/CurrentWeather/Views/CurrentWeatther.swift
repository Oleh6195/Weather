//
//  CurrentWeatther.swift
//  WeatherApp
//
//  Created by Олег on 27.10.2019.
//  Copyright © 2019 Олег. All rights reserved.
//

import SwiftUI

struct CurrentWeatther: View {
    @ObservedObject var w: CurrentWeatherViewModel = CurrentWeatherViewModel()

    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            Text((w.currentWeather?.name ?? ""))
                .font(.largeTitle)

            Text("Sunny")
                .font(.body)

            Text("\(Int(round((w.currentWeather?.main.temp_max) ?? 0)))°")
                .font(Font.custom("verylarge", size: 90))
                .fontWeight(.ultraLight)


//            HStack(spacing: 300) {
//                Text("Sunday")
//                HStack {
//                    Text("22")
//                    Text("7")
//                }
//            }
//            .padding(.top, 80)
        }

    }
}

struct CurrentWeatther_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatther()
    }
}
