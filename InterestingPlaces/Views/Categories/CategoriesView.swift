import SwiftUI

struct CategoriesView: View {
    
    // MARK: - Properties

    @ObservedObject var viewModel: CategoriesViewModel
    
    // MARK: - Views

    var body: some View {
        NavigationView {
            List(viewModel.categories) { category in
                NavigationLink(
                    destination:
                        ObjectsView(viewModel: ObjectsViewModel(category: category)),
                    label: {
                        CategoryCell(viewModel: CategoryCellViewModel(category: category))
                    })
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationBarTitle(Text(Constants.navBarTitle))
            .onAppear {
                viewModel.fetch()
            }
        }
    }
}

// MARK: - Constants

extension CategoriesView {
    enum Constants {
        static let navBarTitle = "Категории"
    }
}
