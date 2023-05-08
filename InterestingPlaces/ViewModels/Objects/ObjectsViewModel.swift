import Foundation

final class ObjectsViewModel: ObservableObject {
    
    // MARK: - Properties

    @Published var category: Category
    @Published var objects: [Object]
        
    // MARK: - Init

    init(category: Category) {
        self.category = category
        self.objects = category.objects ?? []
    }
}
