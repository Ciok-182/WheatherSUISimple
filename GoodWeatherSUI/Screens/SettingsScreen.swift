//
//  SettingsScreen.swift
//  GoodWeatherSUI
//
//  Created by Jorge Encinas on 19/09/21.
//

import SwiftUI

enum TemperatureUnit: String, CaseIterable, Identifiable {
    
    var id: String {
        return rawValue
    }
    
    case celsius
    case fahrenheit
    case kelvin
}

extension TemperatureUnit {
    
    var displayText: String {
        switch self {
            case .celsius:
                return "Celsius"
            case .fahrenheit:
                return "Fahrenheit"
            case .kelvin:
                return "Kelvin"
        }
    }
    
}

struct SettingsScreen: View {
    
    @EnvironmentObject var store : Store
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @AppStorage("unit") private var selectedUnit: TemperatureUnit = .kelvin //save in userDefaults
    
    
    var body: some View {
        VStack {
            Picker(selection: $selectedUnit, label: Text("Select temperature unit?")) {
                ForEach(TemperatureUnit.allCases, id: \.self) {
                    Text("\($0.displayText)" as String)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Spacer()
        }
        .padding()
        .navigationTitle("Settings")
        .navigationBarItems(trailing: Button("Done") {
            
            store.selectedUnit = selectedUnit
            mode.wrappedValue.dismiss()
            
        })
        .embedInNavigationView()
    }
}

struct SettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        SettingsScreen()
    }
}
