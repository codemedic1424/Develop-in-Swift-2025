//
//  ContentView.swift
//  WeatherForecast
//
//  Created by Christopher Wilshusen on 12/6/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Weekly Weather")
            .font(.title)
            .underline()
            .fontWeight(.bold)
            .foregroundStyle(.secondary)
        Text("12/08/2025")
            .font(.caption)
            .padding(.top, 0.5)
        VStack{
            HStack {
                DayForecast(dayOfWeek: "Mon", isRainy: false, high: 70, low: 50)
                
                DayForecast(dayOfWeek: "Tue", isRainy: true, high: 65, low: 48)
            }
            HStack {
                DayForecast(dayOfWeek: "Wed", isRainy: false, high: 70, low: 48)
                
                DayForecast(dayOfWeek: "Thu", isRainy: false, high: 78, low: 62)
            }
            HStack {
                DayForecast(dayOfWeek: "Fri", isRainy: false, high: 70, low: 50)
                
                DayForecast(dayOfWeek: "Sat", isRainy: true, high: 65, low: 48)
            }
            HStack {
                DayForecast(dayOfWeek: "Sun", isRainy: true, high: 70, low: 55)
                WeekForecast(rainyDays: 3)
            }
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
        .background(in: RoundedRectangle(cornerRadius: 5))
        .backgroundStyle(.quinary)
        .padding(6)
    }
}

//TODO: Finish logic for below
//Basic structure added

struct WeekForecast: View {
    let highs = [70, 65, 70, 78, 70, 65, 70]
    let lows = [50, 48, 48, 62, 50, 48, 55]
    var highAvg: Int {
        highs.reduce(0, +)/highs.count
    }
    var lowAvg: Int {
        lows.reduce(0,+)/lows.count
    }
    let rainyDays: Int
    
    
    var body: some View {
        VStack {
            Text("Weather View")
                .font(.title3)
                .fontWeight(.bold)
                .padding(2)
            Text("Avg. High: \(highAvg)ºF")
            Text("Avg. Low: \(lowAvg)ºF")
            Text("# of Rainy Days: ")
        }
    }
}

#Preview {
    ContentView()
}
