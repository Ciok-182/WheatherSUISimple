//
//  Date+Extensions.swift
//  GoodWeatherSUI
//
//  Created by Jorge Encinas on 19/09/21.
//

import Foundation

extension Date {
    
    func formatAsString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        return formatter.string(from: self)
    }
    
}
