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
            DayForecast()
            
            DayForecast()
        }
    }
}
struct DayForecast: View {
    var body: some View {
        VStack {
            Text("Mon")
            Image(systemName: "sun.max.fill")
                .foregroundStyle(.yellow)
            Text("High: 70")
            Text("Low: 50")
        }
        .padding()
    }
}
#Preview {
    ContentView()
}
