/*
See the License.txt file for this sample’s licensing information.
*/

import SwiftUI

struct FunFactsView: View {

    @State private var funFact = ""
    var body: some View {
        VStack {
            Text("Fun Facts")
                .font(.largeTitle)
                .fontWeight(.bold)
                        
            Text(funFact)
                .padding()
                .font(.title)
                .frame(minHeight: 400)

            if #available(iOS 26.0, *) {
                Button("Show Random Fact") {
                    funFact = information.funFacts.randomElement()!
                }
                .buttonStyle(.glass)
            } else {
                Button("Show Random Fact") {
                    funFact = information.funFacts.randomElement()!
                }
                .buttonStyle(.bordered)
            }
        }
        .padding()
    }
}

struct FunFactsView_Previews: PreviewProvider {
    static var previews: some View {
        FunFactsView()
    }
}
