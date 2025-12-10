//
//  WelcomePage.swift
//  OnboardingFlow
//
//  Created by Christopher Wilshusen on 12/10/25.
//

import SwiftUI

struct WelcomePage: View {
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .fill(.tint)                        // background color
                    .frame(width: 150, height: 150)
                    .overlay(                           // border on top
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(.white, lineWidth: 4)
                    )
                    
                
                Image(systemName: "figure.2.and.child.holdinghands")
                    .font(.system(size: 70))
                    .foregroundStyle(.white)
            }
            
            
            Text("Welcome to My App")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .fontDesign(.serif)
                .padding(.top)
            
            Text("Descriptive Text goes here. This is a placeholder for future creativity.")
                .font(.title2)
                .multilineTextAlignment(.center)
        }
        .padding()
    }
}

#Preview {
    WelcomePage()
}
