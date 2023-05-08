import SwiftUI

@main
struct InterestingPlacesApp: App {
    var body: some Scene {
        WindowGroup {
            CategoriesView(viewModel: CategoriesViewModel())
        }
    }
}
