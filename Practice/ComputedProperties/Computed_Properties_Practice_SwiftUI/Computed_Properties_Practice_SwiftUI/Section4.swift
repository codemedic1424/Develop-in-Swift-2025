//
//  Section4.swift
//  Computed_Properties_Practice_SwiftUI
//
//  Created by Christopher Wilshusen on 11/13/25.
//

import SwiftUI

// MARK: - Section 4 – Computed Properties in SwiftUI Views
// ==========================================================


//MARK: Exercise 9 – Button Title Based on State
// @State var isPlaying: Bool
// Computed property buttonTitle -> "Play"/"Pause"
struct Section4: View {
    //MARK: E9 Variables:
    @State var isPlaying: Bool = false
    
    var buttonTitle: String {
        isPlaying ? "Pause" : "Play"
    }
    var buttonImage: String {
        isPlaying ? "pause.fill" : "play.fill"
    }
    func stateToggle() {
        isPlaying.toggle()
    }
    //MARK: E10 Variables:
    @State var isFavorite: Bool = false
    
    var favoriteIcon: String {
        isFavorite ? "star.fill" : "star"
    }
    func buttonChange() {
        isFavorite.toggle()
    }
    //MARK: E11 Properties
    var colorBackground: Color {
        isPlaying ? .green : .gray
    }
    
    var body: some View {
        ZStack {
            colorBackground.ignoresSafeArea().opacity(0.5)
            HStack {
                Button {
                    stateToggle()
                } label: {
                    Label(buttonTitle, systemImage: buttonImage)
                }
                .buttonStyle(.glass)
                .shadow(radius: 5)
                
                
                //MARK: -Exercise 10 – Dynamic Icon Name
                // Computed property favoriteIconName -> "star" or "star.fill"
                Button {
                    buttonChange()
                } label: {
                    Image(systemName: favoriteIcon)
                }
                .buttonStyle(.glass)
                .shadow(radius: 05)
            }
           
        }
        
        //MARK:  Exercise 11 – Card Background Color
        // Computed property cardBackground -> green or gray opacity
    }
        
}


#Preview {
    Section4()
}
