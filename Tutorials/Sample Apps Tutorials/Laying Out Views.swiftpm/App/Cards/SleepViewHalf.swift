/*
See the License.txt file for this sample’s licensing information.
*/

import SwiftUI

struct SleepViewHalf: View {
    @Binding var value: Double
    var isEditing: Bool
    var fontStyle: JournalFont

    var body: some View {
        VStack {
            Text("Hours Slept")
                .foregroundColor(.darkBrown)
                .font(fontStyle.uiFont(15))
            //#-learning-code-snippet(6.frameAlignment)

            Text("\(Int(value))")
                .foregroundColor(.darkBrown)
                .modifier(FontStyle(size: 50))
            //#-learning-code-snippet(5.paddingSleep)
            
            //#-learning-code-snippet(5.stepper)
        }
        //#-learning-code-snippet(5.sleepFrame)
        //#-learning-code-snippet(6.paddingCard)
    }
}

struct SleepViewHalf_Previews : PreviewProvider {
    static var previews: some View {
        SleepViewHalfPreview()
    }
}
