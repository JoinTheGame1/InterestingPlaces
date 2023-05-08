import Foundation

final class CategoriesViewModel: ObservableObject {
    
    // MARK: - Properties
    
    let service: NetworkService
    @Published var categories: [Category] = []
    
    // MARK: - Init

    init() {
        self.service = NetworkService()
    }
    
    // MARK: - Public methods

    func fetch() {
        service.getObjectsData { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .failure(let error):
                self.categories = DataCaretaker.loadCategories() ?? []
                print(error.localizedDescription)
            case .success(let data):
                CategoriesFactory.buildCategoriesWithObjects(from: data) { categories in
                    self.categories = categories
                }
                DataCaretaker.saveCategories(self.categories)
                DataCaretaker.saveGeo(data.geo)
            }
        }
    }
}
