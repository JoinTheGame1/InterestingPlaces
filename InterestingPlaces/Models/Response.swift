import Foundation

// MARK: - Response
struct Response: Codable {
    let data: ResponseData
}

// MARK: - ResponseData
struct ResponseData: Codable {
    let geo: Geo
    let categories: [Category]
    let objects: [Object]
}
