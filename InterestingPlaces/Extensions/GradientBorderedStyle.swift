import SwiftUI

struct GradientBorderedStyle: ButtonStyle {
    
    var isAnimating: Bool

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(.vertical, 12)
            .padding(.horizontal, 28)
            .foregroundColor(.primary)
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(
                        AngularGradient(gradient: Gradient(
                            colors: [.red, .yellow, .green, .blue, .purple, .red]),
                            center: .center,
                            startAngle: isAnimating ? .zero : .degrees(360),
                            endAngle: isAnimating ? .degrees(360) : .degrees(720)
                        ), lineWidth: 1)
                    .opacity(configuration.isPressed ? 0.5 : 1)
                    .animation(.easeInOut(duration: 5).repeatForever(autoreverses: false), value: isAnimating)
            }
    }
}
