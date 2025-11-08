//
//  ContentView.swift
//  WeatherForecast
//
//  Created by Christopher Wilshusen on 11/8/25.
//

import SwiftUI

// MARK: View Construction

struct ContentView: View {
    var body: some View {
        HStack {
            DayForecast(day: "Mon", low: 50, high: 70, isRaining: false)
            
            DayForecast(day: "Tues", low: 40, high: 60, isRaining: true)
        }
    }
}
struct DayForecast: View {
    // MARK: Properties
    
    let day: String
    let low: Int
    let high: Int
    let isRaining: Bool
    
    var iconName: String {
        if isRaining {
            return "cloud.rain.fill"
        } else {
            return "sun.max.fill"
        }
    }
    
    var iconColor: Color {
        if isRaining {
            return Color.blue
        } else {
            return Color.yellow
        }
    }
    
// MARK: View Layout
    var body: some View {
        VStack {
            Text(day)
            Image(systemName: iconName)
                .foregroundStyle(iconColor)
            Text("High \(high)º")
            Text("Low: \(low)º")
        }
        .padding()
    }
}
#Preview {
    ContentView()
}
