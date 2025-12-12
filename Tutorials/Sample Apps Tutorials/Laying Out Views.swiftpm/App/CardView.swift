/*
See the License.txt file for this sample’s licensing information.
*/

import SwiftUI

struct CardView: View {
    @Binding var cardData: CardData
    var isEditing: Bool
    var fontStyle: JournalFont
    
    var body: some View {
        switch cardData.card {
        case .mood(let value):
            MoodView(value: Binding<String>( get: { value }, set: { cardData.card = .mood(value: $0) } ), isEditing: isEditing, fontStyle: fontStyle, size: cardData.size)
        case .sleep(let value):
            SleepView(value: Binding<Double>( get: { value }, set: { cardData.card = .sleep(value: $0) } ), isEditing: isEditing, fontStyle: fontStyle, size: cardData.size)
        case .sketch(let value):
            SketchView(value: Binding<[Line]>( get: { value }, set: { cardData.card = .sketch(value: $0) } ), isEditing: isEditing, fontStyle: fontStyle, size: cardData.size)
        case .photo(let value):
            PhotoView(value: Binding<ImageModel>( get: { value }, set: { cardData.card = .photo(value: $0) } ), isEditing: isEditing, fontStyle: fontStyle)
        case .text(let value):
            TextView(value: Binding<TextData>( get: { value }, set: { cardData.card = .text(value: $0) } ), isEditing: isEditing, fontStyle: fontStyle)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(cardData: .constant(CardData(card: .mood(value: "😢"))), isEditing: true, fontStyle: .font1)
            .background(CardBackground())
    }
}
