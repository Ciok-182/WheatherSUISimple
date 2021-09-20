//
//  Weather.swift
//  GoodWeatherSUI
//
//  Created by Jorge Encinas on 19/09/21.
//

import Foundation

struct WeatherResponse: Decodable {
    var name : String
    var weather: Weather
    let icon: [WeatherIcon]
    let sys: Sys
    
    private enum CodingKeys: String, CodingKey{
        case name
        case weather = "main"
        case icone = "weather"
        case sys = "sys"
    }
    
    private enum WeatherKeys: String, CodingKey{
        case temperature = "temp"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        icon = try container.decode([WeatherIcon].self, forKey: .icone)
        name = try container.decode(String.self, forKey: .name)
        sys = try container.decode(Sys.self, forKey: .sys)
        
        let weatherContainer = try container.nestedContainer(keyedBy: WeatherKeys.self, forKey: .weather)
        let temperature = try weatherContainer.decode(Double.self, forKey: .temperature)
        
        
        
        weather = Weather(city: name, temperature: temperature, icon: icon.first!.icon, sunrise: sys.sunrise, sunset: sys.sunset)
    }
    
}

struct Sys: Decodable {
    let sunrise: Date
    let sunset: Date
    
    private enum CodingKeys: String, CodingKey{
        case sunrise = "sunrise"
        case sunset = "sunset"
    }
    
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let sunriseTimeInterval = try container.decode(Int32.self, forKey: .sunrise)
        let sunsetTimeInterval = try container.decode(Int32.self, forKey: .sunset)
        
        sunset = Date(timeIntervalSince1970: TimeInterval(sunsetTimeInterval))
        sunrise = Date(timeIntervalSince1970: TimeInterval(sunriseTimeInterval))
    }
}

struct WeatherIcon: Decodable {
    let main: String
    let description: String
    let icon: String
}

struct Weather: Decodable {
    let city: String
    let temperature: Double
    let icon: String
    let sunrise: Date
    let sunset: Date
    
}
