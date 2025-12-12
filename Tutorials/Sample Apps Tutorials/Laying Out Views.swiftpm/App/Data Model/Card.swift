/*
See the License.txt file for this sample’s licensing information.
*/

import SwiftUI
import CoreTransferable
import Foundation
import PhotosUI

enum Card: Equatable, CaseIterable, Codable {
    case mood(value: String)
    case sleep(value: Double)
    case sketch(value: [Line])
    case text(value: TextData)
    case photo(value: ImageModel)
    
    static var allCases: [Card] {
        return [.sleep(value: 0), .mood(value: "😁"), .text(value: TextData()), .photo(value: ImageModel()), .sketch(value: [Line]())]}
    
    var id: UUID { UUID() }
    
    var isPhoto: Bool {
        switch self {
        case .photo(_): return true
        default: return false
        }
    }
    
    static func title(_ card: Card) -> String {
        switch card {
        case mood(_):
            return "Mood Tracker"
        case sleep(_):
            return "Sleep Tracker"
        case sketch(_):
            return "Doodle"
        case text(_):
            return "Text Field"
        case photo(_):
            return "Photo"
        }
    }
    
    static func icon(_ card: Card) -> String {
        switch card {
        case mood(_):
            return "face.smiling.fill"
        case sleep(_):
            return "moon.zzz.fill"
        case sketch(_):
            return "pencil.tip"
        case text(_):
            return "textformat"
        case photo(_):
            return "photo.fill"
        }
    }
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        switch (lhs, rhs) {
        case (.mood(let valueL), .mood(let valueR)):
            return valueL == valueR
        case (.sleep(let valueL), .sleep(let valueR)):
            return valueL == valueR
        case (.sketch(let valueL), .sketch(let valueR)):
            return valueL == valueR
        case (.text(let valueL), .text(let valueR)):
            return valueL == valueR
        case (.photo(let valueL), .photo(let valueR)):
            return valueL.url == valueR.url
        default:
            return false
        }
    }
}

struct CardData: Equatable, Codable {
    var card: Card
    var size: CardSize = .large
    
    mutating func updateSize(from newsize: CardSize){
        size = newsize
    }
}

enum CardSize: String, CaseIterable, Codable {
    case small
    case large
}

enum ImageState {
    case empty, loading, success(URL), failure(Error)
}

struct ImageModel: Codable {
    
    enum Location: String, Codable {
        case resources, documents
    }
    var fileName: String?
    var location = Location.documents
    
    var url: URL? {
        if location == .resources {
            if let jpegImage = Bundle.main.url(forResource: fileName, withExtension: "jpeg") {
                return jpegImage
            } else {
                return Bundle.main.url(forResource: fileName, withExtension: "png")
            }
        } else {
            guard let fileName else {
                return nil
            }
            let documentDirectory = FileManager.default.documentDirectory
            return documentDirectory.appendingPathComponent(fileName)
        }
        
    }
}
struct PhotoFile: Transferable {
    let url: URL
    
    static var transferRepresentation: some TransferRepresentation {
        FileRepresentation(contentType: .image, shouldAttemptToOpenInPlace: false) { data in
            SentTransferredFile(data.url, allowAccessingOriginalFile: true)
        } importing: { received in
            let tempDirectory = FileManager.default.temporaryDirectory
            let fileName = received.file.lastPathComponent
            let destinationURL = tempDirectory.appendingPathComponent(fileName)
            try FileManager.default.copyItem(at: received.file, to: destinationURL)
            return Self.init(url: destinationURL)
        }
    }
}

struct Line: Identifiable, Equatable, Codable {
    var points: [CGPoint]
    var color: Color {
        return Color(rgbaColor)
    }
    private var rgbaColor: RGBAColor
    var lineWidth: CGFloat
    var id = UUID()
    
    init(points: [CGPoint], color: Color, lineWidth: CGFloat) {
        self.points = points
        self.rgbaColor = color.rgbaColor
        self.lineWidth = lineWidth
    }
}

struct TextData: Equatable, Codable {
    var text: String = "Write Something"
    var fontSize: FontSize = .medium
}

enum FontSize: CGFloat, CaseIterable, Codable {
    case small = 12
    case medium = 16
    case large = 20
}
