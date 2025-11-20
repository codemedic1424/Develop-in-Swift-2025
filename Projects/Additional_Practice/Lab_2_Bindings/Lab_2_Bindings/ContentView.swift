//
//  ContentView.swift
//  Lab_2_Bindings
//
//  Created by Christopher Wilshusen on 11/11/25.
//

import SwiftUI
//MARK: Parent View
struct ContentView: View {
    //MARK: View Variables
    @State var isOn: Bool = false
    @State var counter = [1, 2, 3]
    
    
    var body: some View {
        
        VStack {
            //Toggle("On or Off?", isOn: $isOn)
            Text(isOn ? "The switch is on" : "The switch is off")
            ChildView(isOn: $isOn)
            
                .padding()
            
            ForEach(counter.indices, id: \.self) { index in
                CounterRowVIew(counter: $counter[index])
            }
        }
        HStack() {
            Spacer()
            Button("Reset") {
                counter = [1, 2, 3]
            }
            .foregroundStyle(.red)
            .padding(20)
            
        }
    }
}

#Preview {
    ContentView()
}
