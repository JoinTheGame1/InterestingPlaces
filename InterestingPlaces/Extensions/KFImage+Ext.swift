import SwiftUI
import Kingfisher

extension KFImage {
    func rounded(width: CGFloat, height: CGFloat, cornerRadius: CGFloat) -> some View {
        self
            .resizable()
            .scaledToFill()
            .frame(width: width, height: height)
            .cornerRadius(cornerRadius)
    }
}
