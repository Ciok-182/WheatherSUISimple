//
//  UserDefaults+Extensions.swift
//  GoodWeatherSUI
//
//  Created by Jorge Encinas on 19/09/21.
//

import Foundation

extension UserDefaults {
    
    var unit: TemperatureUnit {
        guard let value = self.value(forKey: "unit") as? String else {
            return .kelvin
        }
        return TemperatureUnit(rawValue: value) ?? .kelvin
    }
    
}
