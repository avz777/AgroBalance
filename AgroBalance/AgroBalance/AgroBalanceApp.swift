//
//  AgroBalanceApp.swift
//  AgroBalance
//
//  Created by Andrey Zhuravlev on 26/4/25.
//

import SwiftUI

@main
struct AgroBalanceApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

// Round Double
func round(value: Double, toDecimalPlaces places: Int) -> Double {
    let divisor = pow(10.0, Double(places))
    return (value * divisor).rounded() / divisor
}
