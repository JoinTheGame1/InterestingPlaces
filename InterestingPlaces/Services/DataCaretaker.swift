import Foundation

final class DataCaretaker {
    
    // MARK: - Properties

    static let decoder = JSONDecoder()
    static let encoder = JSONEncoder()
    
    // MARK: - Static methods

    static func saveCategories(_ categories: [Category]) {
        do {
            let encodedCategories = try self.encoder.encode(categories)
            UserDefaults.standard.set(encodedCategories, forKey: Constants.categoriesKey)
        } catch {
            debugPrint(String(describing: error))
        }
    }
    
    static func saveGeo(_ geo: Geo) {
        do {
            let encodedGeo = try self.encoder.encode(geo)
            UserDefaults.standard.set(encodedGeo, forKey: Constants.geoKey)
        } catch {
            debugPrint(String(describing: error))
        }
    }
    
    static func loadCategories() -> [Category]? {
        guard let data = UserDefaults.standard.data(forKey: Constants.categoriesKey)
        else { return nil }
        
        do {
            let categories = try self.decoder.decode([Category].self, from: data)
            return categories
        } catch {
            debugPrint(String(describing: error))
            return nil
        }
    }
    
    static func loadGeo() -> Geo? {
        guard let data = UserDefaults.standard.data(forKey: Constants.geoKey)
        else { return nil }
        
        do {
            let geo = try self.decoder.decode(Geo.self, from: data)
            return geo
        } catch {
            debugPrint(String(describing: error))
            return nil
        }
    }
}

extension DataCaretaker {
    enum Constants {
        static let categoriesKey = "Category"
        static let geoKey = "Geo"
    }
}
