import SwiftUI
import Kingfisher

struct ObjectInfoView: View {
    
    // MARK: - Properties

    @ObservedObject var viewModel: ObjectInfoViewModel
    @State var isScheduleTapped = false
    @State var animateBorder = false
    
    // MARK: - Views

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 8) {
                closeInfoText
                objectImage
                objectNameText
                objectDescriptionText
                if !viewModel.workingDays.isEmpty {
                    VStack {
                        scheduleButton
                        if isScheduleTapped {
                            scheduleList
                        }
                    }
                    .modifier(RoundedGradientBorder(isAnimating: animateBorder))
                    .padding(.vertical, 12)
                }
                routeButton
            }
            .padding(20)
        }
        .onAppear {
            animateBorder.toggle()
        }
    }
    
    var closeInfoText: some View {
        HStack(spacing: 8) {
            Text(viewModel.object.closeInfo)
            Image(systemName: "circle.fill")
                .foregroundColor(viewModel.object.close ? .red : .green)
        }
        .padding(.vertical, 20)
    }
    
    var objectImage: some View {
        KFImage(viewModel.object.imageUrl)
            .placeholder {
                ProgressView()
            }
            .rounded(width: 350, height: 200, cornerRadius: 16)
    }
    
    var objectNameText: some View {
        Text(viewModel.object.name)
            .font(.title)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .padding(.vertical, 8)
    }
    
    var objectDescriptionText: some View {
        Text(viewModel.object.description)
            .font(.body)
            .multilineTextAlignment(.center)
    }
    
    var scheduleButton: some View {
        Button {
            withAnimation(.easeInOut(duration: 0.3)) {
                isScheduleTapped.toggle()
            }
        } label: {
            HStack(spacing: 8) {
                Text(Constants.scheduleText)
                Image(systemName: isScheduleTapped ? "chevron.up" : "chevron.down")
            }
            .foregroundColor(.primary)
        }
    }
    
    var scheduleList: some View {
        VStack(spacing: 8) {
            ForEach(viewModel.workingDays, id: \.self) { workingSegment in
                HStack {
                    Text(workingSegment[0])
                    Spacer()
                    Text(workingSegment[1])
                }
            }
        }
        .frame(width: 220)
        .padding(.top, 8)
    }
    
    var routeButton: some View {
        Button(action: {
            viewModel.showRoute()
        }, label: {
            HStack(spacing: 8) {
                Text(Constants.plotARouteButtonText)
                Image(systemName: "arrow.right")
            }
        })
        .buttonStyle(GradientBorderedStyle(isAnimating: animateBorder))
    }
}

// MARK: - Constants

extension ObjectInfoView {
    enum Constants {
        static let scheduleText = "График работы"
        static let plotARouteButtonText = "Проложить маршрут"
    }
}
