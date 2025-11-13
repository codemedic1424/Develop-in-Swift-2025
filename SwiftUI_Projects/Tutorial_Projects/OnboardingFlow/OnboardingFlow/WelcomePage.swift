//
//  WelcomePage.swift
//  OnboardingFlow
//
//  Created by Christopher Wilshusen on 11/13/25.
//

import SwiftUI

struct WelcomePage: View {
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: 150, height: 150)
                    .foregroundStyle(.tint)
                
                Image(systemName: "figure.2.and.child.holdinghands")
            }
            
            Text("Welcome to My App")
                .font(.title)
                .fontWeight(.semibold)
                .fontDesign(.monospaced)
                .padding(.top)
                .border(.black, width: 1.5)
            
            Text("I hope you like it. This was my first build with Swift and SwiftUI.")
                .font(.title2)
                .multilineTextAlignment(.center)
                .border(.black, width: 1.5)
        }
        .border(.orange, width: 2)
        .padding()
        .border(.blue, width: 1)
    }
}

#Preview {
    WelcomePage()
}
