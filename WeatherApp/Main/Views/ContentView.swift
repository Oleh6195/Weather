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
    var hours:[String] = ["03", "06", "09","12","15","18","21",]
    var body: some View {
        VStack{
            CurrentWeatther()
                .padding(.top, 163.0)
            Divider()
            HStack(alignment: .bottom) {
//                ForEach(hours) { i in
//                    Text("03").frame(width: 25, height: 58).padding(.leading, 18)
//                }
                Text("03").frame(width: 25, height: 58).padding(.leading, 18)
                Text("06").frame(width: 25, height: 58).padding(.leading, 18)
                Text("09").frame(width: 25, height: 58).padding(.leading, 18)
                Text("12").frame(width: 25, height: 58).padding(.leading, 18)
                Text("15").frame(width: 25, height: 58).padding(.leading, 18)
                Text("18").frame(width: 25, height: 58).padding(.leading, 18)
                Text("21").frame(width: 25, height: 58).padding(.leading, 18)
            }.padding(.leading, 18)
            List(weather.forecast) { item in
                Divider()
                HStack {
                    Text(String(item.hours[0].time.day!))
                    ForEach(item.hours) { el in
                        VStack {
                            Image(el.weather[0].icon).padding(.bottom, -10)
                            Text(String(Int(round(el.main.temp_max))))
                        }
                        .frame(width: 25, height: 58)
//                        .padding(.bottom, 10)
                        Spacer()
                    }
                }
                
            }
            .frame(height: 500)
            
        }
    .background(Image("sunny")
    .resizable()
    .scaledToFill()
    .clipped())
        .edgesIgnoringSafeArea([.top, .bottom])
    .padding(.top)
    .padding(.bottom)
    }


}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
