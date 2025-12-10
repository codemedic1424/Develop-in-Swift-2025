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
            Text("Welcome to My App")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .fontDesign(.serif)
        }
        .padding()
    }
}

#Preview {
    WelcomePage()
}
