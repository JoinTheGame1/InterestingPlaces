import Foundation

// MARK: - Object
struct Object: Codable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let image: String
    let type: String
    let close: Bool
    let icon: String
    let color: String
    let latitude: Double
    let longitude: Double
    let businessHours: [BusinessHour]?

    var imageUrl: URL? {
        URL(string: image)
    }
    var closeInfo: String { "Сейчас " + (close ? "закрыто" : "открыто") }
    
    enum CodingKeys: String, CodingKey {
        case id, name, description, image, type, close, icon, color
        case latitude = "lat"
        case longitude = "lon"
        case businessHours = "working_hours"
    }
}

// MARK: - WorkingTime
struct BusinessHour: Codable {
    let days: [Int]
    let from: String
    let to: String
}
