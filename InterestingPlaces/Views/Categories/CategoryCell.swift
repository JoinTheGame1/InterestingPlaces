import SwiftUI

struct CategoryCell: View {
    
    // MARK: - Properties

    @ObservedObject var viewModel: CategoryCellViewModel
    
    // MARK: - Views

    var body: some View {
        HStack {
            Text(viewModel.category.name)
                .font(.title2)
            Spacer()
            ZStack {
                Circle()
                    .frame(width: 32, height: 32)
                    .foregroundColor(Color(viewModel.category.color))
                Text("\(viewModel.category.count)")
                    .foregroundColor(.white)
            }
        }
    }
}
