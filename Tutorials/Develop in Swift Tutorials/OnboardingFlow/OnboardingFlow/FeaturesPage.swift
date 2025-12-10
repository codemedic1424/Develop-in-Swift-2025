//
//  FeaturesPage.swift
//  OnboardingFlow
//
//  Created by Christopher Wilshusen on 12/10/25.
//

import SwiftUI

struct FeaturesPage: View {
    var body: some View {
        VStack(spacing: 30) {
            Text("Features").font(.title).fontWeight(.semibold).padding(.bottom)
                .padding(.top, 100)
            
            FeatureCard(iconName: "person.2.crop.square.stack.fill", description: "A multiline description about a feature paired with an icon image.")
            
            FeatureCard(iconName: "quote.bubble.fill", description: "Short Summary")
            
            Spacer()
            
        }
        .padding()
    }
}

#Preview {
    FeaturesPage()
}
