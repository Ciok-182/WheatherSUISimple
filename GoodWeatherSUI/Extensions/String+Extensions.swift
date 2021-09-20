//
//  String+Extensions.swift
//  GoodWeatherSUI
//
//  Created by Jorge Encinas on 19/09/21.
//

import Foundation

extension String {
    
    func escaped() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }    
}
