//
//  WeatherViewModel.swift
//  GoodWeatherSUI
//
//  Created by Jorge Encinas on 19/09/21.
//

import Foundation

struct WeatherViewModel {
    let weather: Weather
    
    var temperature: Double{
        return weather.temperature
    }
    
    var city: String{
        return weather.city
    }
    
    var icon: String {
        return weather.icon
    }
    
    var sunrise: Date {
        return weather.sunrise
    }
    
    var sunset: Date{
        return weather.sunset
    }
}