/*
See the License.txt file for this sample’s licensing information.
*/

import SwiftUI

struct LayingOutContainersView: View {
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .foregroundColor(.themeBlue)
                Circle()
                    .foregroundColor(.themePink)
            }
            ZStack {
                Rectangle()
                    .foregroundColor(.themeBlue)
                HStack {
                    Circle()
                        .foregroundColor(.themeRed)
                    Circle()
                        .foregroundColor(.themeOrange)
                }
            }
        }
    }
}

struct LayingOutContainersView_Previews: PreviewProvider {
    static var previews: some View {
        LayingOutContainersView()
    }
}
