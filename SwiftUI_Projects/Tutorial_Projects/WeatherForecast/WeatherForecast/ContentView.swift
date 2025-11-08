//
//  ContentView.swift
//  WeatherForecast
//
//  Created by Christopher Wilshusen on 11/8/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            DayForecast(day: "Mon", low: 50, high: 70)
            
            DayForecast(day: "Tues", low: 40, high: 60)
        }
    }
}
struct DayForecast: View {
    let day: String
    let low: Int
    let high: Int
    //let weatherImage: Image
    
    var body: some View {
        VStack {
            Text(day)
            Image(systemName: "sun.max.fill")
                .foregroundStyle(.yellow)
            Text("High \(high)º")
            Text("Low: \(low)º")
        }
        .padding()
    }
}
#Preview {
    ContentView()
}
