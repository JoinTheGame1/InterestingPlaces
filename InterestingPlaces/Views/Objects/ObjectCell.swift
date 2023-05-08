import SwiftUI
import Kingfisher

struct ObjectCell: View {
    
    // MARK: - Properties

    @ObservedObject var viewModel: ObjectCellViewModel
    
    // MARK: - Views

    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            objectImage
            VStack(alignment: .leading, spacing: 8) {
                objectNameText
                objectDescriptionText
            }
            .padding(.leading, 8)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 8)
    }
    
    var objectImage: some View {
        KFImage(viewModel.object.imageUrl)
            .placeholder {
                ProgressView()
            }
            .rounded(width: 120, height: 80, cornerRadius: 8)
    }
    
    var objectNameText: some View {
        Text(viewModel.object.name)
            .font(.callout)
            .fontWeight(.semibold)
            .multilineTextAlignment(.leading)
            .foregroundColor(.primary)
    }
    
    var objectDescriptionText: some View {
        Text(viewModel.object.description)
            .font(.footnote)
            .lineLimit(2)
            .multilineTextAlignment(.leading)
            .foregroundColor(.gray)
    }
}
