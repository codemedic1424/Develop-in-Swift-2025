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
        HStack{
            Button("Prev Week", systemImage: "chevron.backward") {
                //TODO: Add button action
            }
            Spacer()
            Button {
                //TODO: Add button action
            } label: {
                HStack(spacing: 6) {
                    Text(" Next Week")
                    Image(systemName: "chevron.forward")
                }
            }
        }
        .padding()
        
        
        Text("Weekly Weather Forecast")
            .font(.title)
        VStack {
            HStack {
                DayForecast(day: "Mon", low: 50, high: 70, isRaining: false)
                
                DayForecast(day: "Tues", low: 40, high: 60, isRaining: true)
            }
            HStack {
                DayForecast(day: "Wed", low: 46, high: 72, isRaining: false)
                
                DayForecast(day: "Thurs", low: 56, high: 76, isRaining: false)
            }
            HStack {
                DayForecast(day: "Fri", low: 54, high: 80, isRaining: false)
                
                DayForecast(day: "Sat", low: 42, high: 64, isRaining: true)
            }
            HStack {
                DayForecast(day: "Sun", low: 40, high: 62, isRaining: true)
            }
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
    //TODO: adjust spacing and add background tinting
    var body: some View {
        VStack {
            Text(day)
                .font(.headline)
            Image(systemName: iconName)
                .foregroundStyle(iconColor)
                .font(.title)
                .padding(.bottom, 5)
            Text("High \(high)º")
                .fontWeight(.semibold)
            Text("Low: \(low)º")
                .foregroundStyle(.secondary)
        }
        .padding()
    }
}
#Preview {
    ContentView()
}
