/*
See LICENSE folder for this sample’s licensing information.
*/

import SwiftUI

struct ContentView: View {
    var body: some View {
        LazyHStack {
            Image(systemName: "globe")
                .imageScale(.medium)
                .foregroundColor(.teal)
            Text("Hello, Chris!")
        }
        .padding([.leading, .trailing], 40) //syntax for multiple edges
    }
}
#Preview {
    ContentView()
}
