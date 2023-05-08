import Foundation

// MARK: - Category

struct Category: Codable, Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let icon: String
    let color: String
    let count: Int
    
    var objects: [Object]?
    
    enum CodingKeys: String, CodingKey {
        case name, type, icon, color, count
    }
}
