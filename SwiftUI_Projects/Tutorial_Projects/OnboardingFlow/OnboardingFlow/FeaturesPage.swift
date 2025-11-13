//
//  FeaturesPage.swift
//  OnboardingFlow
//
//  Created by Christopher Wilshusen on 11/13/25.
//

import SwiftUI

struct FeaturesPage: View {
    var body: some View {
        VStack {
            Text("Features")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.bottom)
            
            FeatureCard(iconName: "person.2.crop.square.stack.fill", description: "A multiline description about a feature paired with the image on the left.")
           
            FeatureCard(iconName: "music.note.square.stack.fill", description: "Tag youre favorite songs and artists to see updates.")
            
            FeatureCard(iconName: "quote.bubble.fill", description: "Communicate with freinds and family about the latest viral trends.")
            
            FeatureCard(iconName: "plus.circle.fill", description: "Add your closest friends and family.")
        }
        .padding()
    }
}

#Preview {
    FeaturesPage()
}
