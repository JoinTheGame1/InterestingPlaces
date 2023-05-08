import Foundation

final class CategoryCellViewModel: ObservableObject {
    
    // MARK: - Properties

    @Published var category: Category
    
    // MARK: - Init

    init(category: Category) {
        self.category = category
    }
}
