//
//  Section4.swift
//  Computed_Properties_Practice_SwiftUI
//
//  Created by Christopher Wilshusen on 11/13/25.
//

import SwiftUI

// MARK: - Section 4 – Computed Properties in SwiftUI Views
// ==========================================================


// Exercise 10 – Dynamic Icon Name
// Computed property favoriteIconName -> "star" or "star.fill"

// Exercise 11 – Card Background Color
// Computed property cardBackground -> green or gray opacity

//MARK: Exercise 9 – Button Title Based on State
// @State var isPlaying: Bool
// Computed property buttonTitle -> "Play"/"Pause"
struct Section4: View {
    //MARK: E9 Variables
    @State var isPlaying: Bool = false
    
    var buttonTitle: String {
        if isPlaying {
            return "Play"
        } else {
            return "Pause"
        }
    }
    func stateToggle() {
        isPlaying.toggle()
    }
    
    var body: some View {
        Button(buttonTitle) {
            stateToggle()
        }
       
      

        
    }
}

#Preview {
    Section4()
}
