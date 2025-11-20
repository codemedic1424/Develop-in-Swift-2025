//
//  CounterRowVIew.swift
//  Lab_2_Bindings
//
//  Created by Christopher Wilshusen on 11/11/25.
//

import SwiftUI

struct CounterRowVIew: View {
    //MARK: Binding Variable
    @Binding var counter: Int
    
    func counterUp() {
        counter += 1
        print("I got tapped (+). The value is now \(counter).")
    }
    
    func counterDown() {
        counter -= 1
        print("I got tapped (-). The value is now \(counter).")
    }
    
    var body: some View {
        HStack {
                Button("Up", systemImage: "plus.circle", action: counterUp)
                .labelStyle(.iconOnly)
                .frame(width: 80, height: 60)
                .font(.title)
                .buttonStyle(.bordered)
                
                Text(String(counter))
                .font(.title)
            
            Button("Down", systemImage: "minus.circle", action: counterDown)
                .labelStyle(.iconOnly)
                .frame(width: 80, height: 60)
                .font(.title)
                .buttonStyle(.bordered)
                .tint(.red)
        }
    }
}

#Preview {
    CounterRowVIew(counter: Binding.constant(2))
}
