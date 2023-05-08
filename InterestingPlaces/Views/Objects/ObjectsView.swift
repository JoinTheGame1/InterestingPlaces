import SwiftUI

struct ObjectsView: View {
        
    // MARK: - Properties

    @ObservedObject var viewModel: ObjectsViewModel
    
    // MARK: - Views

    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 8) {
                ForEach(viewModel.objects) { object in
                    NavigationLink(
                        destination: ObjectInfoView(viewModel: ObjectInfoViewModel(object: object)),
                        label: {
                            ObjectCell(viewModel: ObjectCellViewModel(object: object))
                        })
                    .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
                .navigationBarTitle(Text(viewModel.category.name))
            }
        }
    }
}
