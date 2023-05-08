import SwiftUI

struct RoundedGradientBorder: ViewModifier {
    
    var isAnimating: Bool
    
    func body(content: Content) -> some View {
        content
            .padding(.vertical, 12)
            .padding(.horizontal, 28)
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(
                        AngularGradient(gradient: Gradient(
                            colors: [.blue, .purple, .red, .yellow, .green, .blue]),
                            center: .center,
                            startAngle: isAnimating ? .zero : .degrees(360),
                            endAngle: isAnimating ? .degrees(360) : .degrees(720)
                        ), lineWidth: 1)
                    .animation(.linear(duration: 5).repeatForever(autoreverses: false), value: isAnimating)
            }
    }
}
