//
//  ContentView.swift
//  WeatherForecast
//
//  Created by Christopher Wilshusen on 12/6/25.
//

import SwiftUI

//MARK: Models

// Week Data Model
struct WeekModel {
    let days: [DayModel]
    
    var highAvg: Int {
        guard !days.isEmpty else { return 0 }
        return days.reduce(0) { $0 + $1.high } / days.count
    }
    
    var lowAvg: Int {
        guard !days.isEmpty else { return 0 }
        return days.reduce(0) { $0 + $1.low } / days.count
    }
    
    var rainyDays: Int {
        days.filter { $0.isRainy }.count
    }
}

// Day Data Model
struct DayModel {
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
}

//MARK: Views

//Forecast Layout
struct DayForecast: View {
    let day: DayModel
    var body: some View {
        VStack {
            Text(day.dayOfWeek)
                .font(.headline)
            Image(systemName: day.weatherImage)
                .foregroundStyle(day.weatherImage == "cloud.rain.fill" ? .blue : .yellow)
                .font(.largeTitle)
                .padding(5)
            Text("High: \(day.high)°F")
                .foregroundStyle(day.high > 80 ? .red : .primary)
                .fontWeight(day.high > 80 ? .bold : .regular)
            Text("Low: \(day.low)°F")
                .foregroundStyle(day.low < 50 ? .blue : .primary)
                .fontWeight(day.low < 50 ? .bold : .regular)
        }
        .padding()
        .background(in: RoundedRectangle(cornerRadius: 5))
        .backgroundStyle(.quinary)
        .padding(6)
    }
}

// Week Data Layout
struct WeekForecast: View {
    let week: WeekModel
    
    var body: some View {
        VStack {
            Text("Weather View")
                .font(.title3)
                .fontWeight(.bold)
                .padding(2)
            Text("Avg. High: \(week.highAvg)ºF")
            Text("Avg. Low: \(week.lowAvg)ºF")
            Text("# of Rainy Days: \(week.rainyDays)")
        }
    }
}

struct ContentView: View {
    let monday = DayModel(dayOfWeek: "Mon", isRainy: false, high: 70, low: 60)
    let tuesday = DayModel(dayOfWeek: "Tue", isRainy: false, high: 71, low: 61)
    let wednesday = DayModel(dayOfWeek: "Wed", isRainy: true, high: 72, low: 62)
    let thursday = DayModel(dayOfWeek: "Thu", isRainy: true, high: 73, low: 63)
    let friday = DayModel(dayOfWeek: "Fri", isRainy: true, high: 85, low: 75)
    let saturday = DayModel(dayOfWeek: "Sat", isRainy: false, high: 60, low: 50)
    let sunday = DayModel(dayOfWeek: "Sun", isRainy: false, high: 55, low: 45)
    
    var body: some View {
        // Title
        Text("Weekly Weather")
            .font(.title)
            .underline()
            .fontWeight(.bold)
            .foregroundStyle(.secondary)
        Text("12/08/2025")
            .font(.caption)
            .padding(.top, 0.5)
        
        // Card Arrangement
        VStack{
            HStack {
                DayForecast(day: monday)
                
                DayForecast(day: tuesday)
            }
            HStack {
                DayForecast(day: wednesday)
                
                DayForecast(day: thursday)
            }
            HStack {
                DayForecast(day: friday)
                
                DayForecast(day: saturday)
            }
            HStack {
                DayForecast(day: sunday)
                WeekForecast(week: WeekModel(days: [monday, tuesday, wednesday, thursday, friday, saturday, sunday]))
            }
        }
    }
}





#Preview {
    ContentView()
}
