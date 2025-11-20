//
//  ChildView.swift
//  Lab_2_Bindings
//
//  Created by Christopher Wilshusen on 11/11/25.
//

import SwiftUI

struct ChildView: View {
    //MARK: Binding variable
    @Binding var isOn: Bool
    
    var body: some View {
        Button("Change System") {
            isOn.toggle()
        }
        .padding()
        .buttonStyle(.bordered)
        Text("System Status")
            .font(.largeTitle)
        RoundedRectangle(cornerRadius: 5)
            .frame(width: 200, height: 200)
            .foregroundStyle(isOn ? .green : .red)
    }
}

#Preview {
    ChildView(isOn: Binding.constant(true))
}
