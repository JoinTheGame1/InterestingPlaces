import Foundation

final class ObjectCellViewModel: ObservableObject {
    
    // MARK: - Properties

    @Published var object: Object
    
    // MARK: - Init

    init(object: Object) {
        self.object = object
    }
}
