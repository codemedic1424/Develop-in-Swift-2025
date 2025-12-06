/*
See LICENSE folder for this sample’s licensing information.
*/

import SwiftUI

class Journal: ObservableObject {
    @Published var entries: [JournalEntry] = [
        JournalEntry(
            createdDate: today(minus: 2),
            text: "Had a wonderful time at the county fair."),
        JournalEntry(
            createdDate: today(minus: 5),
            text: "Spent the afternoon at the farmer's market. The food was delicious and I'm excited to eat the tomatoes that I bought. Wish I had gotten the name of the band playing music. They were great."),
    ]
    
    func addSampleEntry() {
        let entry = JournalEntry(
            createdDate: Date(),
            text: "This is a new sample journal entry.")
        entries.append(entry)
    }

    private static func today(minus days: Int) -> Date {
        let dateComponents = DateComponents(day: -days)
        return Calendar.current.date(byAdding: dateComponents, to: Date()) ?? Date()
    }
}
