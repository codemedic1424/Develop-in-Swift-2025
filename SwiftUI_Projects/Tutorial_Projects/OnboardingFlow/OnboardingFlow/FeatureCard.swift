//
//  FeatureCard.swift
//  OnboardingFlow
//
//  Created by Christopher Wilshusen on 11/13/25.
//

import SwiftUI

struct FeatureCard: View {
    //MARK: Card Properties:
    let iconName: String
    let description: String
    
    var body: some View {
        HStack{
            Image(systemName: iconName)
                .font(.largeTitle)
                .frame(width: 50)
                .padding(.trailing, 10)
            
            Text(description)
            
            Spacer()
        }
        .padding()
        .background(.tint, in: RoundedRectangle(cornerRadius: 12))
        .foregroundStyle(.white)
    }
}

#Preview {
    FeatureCard(iconName: "person.2.crop.square.stack.fill", description: "A multiline description about a feature paired with an image on the left")
}
