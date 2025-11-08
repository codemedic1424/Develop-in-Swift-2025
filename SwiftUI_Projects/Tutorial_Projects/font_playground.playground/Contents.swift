import Cocoa
import SwiftUI
import PlaygroundSupport

struct FontPreview: View {
    let text = "SwiftUI Fonts"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(text).font(.largeTitle)
            Text(text).font(.title)
            Text(text).font(.title2)
            Text(text).font(.title3)
            Text(text).font(.headline)
            Text(text).font(.subheadline)
            Text(text).font(.body)
            Text(text).font(.callout)
            Text(text).font(.footnote)
            Text(text).font(.caption)
            Text(text).font(.caption2)
        }
        .padding()
    }
}
PlaygroundPage.current.setLiveView(FontPreview())
