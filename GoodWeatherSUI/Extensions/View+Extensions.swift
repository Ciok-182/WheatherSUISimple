//
//  View+Extensions.swift
//  GoodWeatherSUI
//
//  Created by Jorge Encinas on 19/09/21.
//

import SwiftUI

extension View {
    
    func embedInNavigationView() -> some View {
        return NavigationView { self }
    }
    
}
