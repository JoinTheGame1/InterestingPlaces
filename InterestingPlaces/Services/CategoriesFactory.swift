final class CategoriesFactory {
    
    // MARK: - Static methods

    static func buildCategoriesWithObjects(from data: ResponseData, completion: ([Category]) -> Void){
        let categoriesWithObjects = data.categories.map { category in
            Category(
                name: category.name,
                type: category.type,
                icon: category.icon,
                color: category.color,
                count: category.count,
                objects: data.objects.filter({ $0.type == category.type })
            )
        }
        
        completion(categoriesWithObjects)
    }
}
