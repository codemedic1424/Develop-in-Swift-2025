//
//  ContentView.swift
//  WeatherForecast
//
//  Created by Christopher Wilshusen on 12/6/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            DayForecast(dayOfWeek: "Mon", isRainy: false, high: 70, low: 50)
            
            DayForecast(dayOfWeek: "Tue", isRainy: true, high: 65, low: 48)
        }
    }
}

struct DayForecast: View {
    
    //struct properties
    let dayOfWeek: String
    let isRainy: Bool
    let high: Int
    let low: Int
    
    var weatherImage: String {
        if isRainy {
            "cloud.rain.fill"
        } else {
            "sun.max.fill"
        }
    }
  
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.headline)
            Image(systemName: weatherImage)
                .foregroundStyle(weatherImage == "cloud.rain.fill" ? .blue : .yellow)
                .font(.largeTitle)
                .padding(5)
            Text("High: \(high)°F")
            Text("Low: \(low)°F")
                .foregroundStyle(low < 50 ? .blue : .primary)
                .fontWeight(low < 50 ? .bold : .regular)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
