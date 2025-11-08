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
            VStack {
                Text("Mon")
                Image(systemName: "sun.max.fill")
                    .foregroundStyle(.yellow)
                Text("High: 70")
                Text("Low: 50")
            }
            .padding()
            
            VStack {
                Text("Tues")
                Image(systemName: "cloud.rain.fill")
                    .foregroundStyle(.blue)
                Text("High: 60")
                Text("Low: 40")
            }
        }
    }
}

#Preview {
    ContentView()
}
