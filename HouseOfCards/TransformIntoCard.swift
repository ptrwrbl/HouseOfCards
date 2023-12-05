import SwiftUI

struct TransformIntoCard: ViewModifier {
    let isFaceUp: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: constants.cornerRadius)
            Group {
                base.fill(Color.white)
                base.strokeBorder(lineWidth: constants.lineWidth)
                content
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill()
            .opacity(isFaceUp ? 0 : 1)
            .rotation3DEffect(
                .degrees(isFaceUp ? 0 : 180),
                axis: (0,1,0)
            )
            .animation(.linear(duration: 2), value: isFaceUp)
        }
    }
    
    private struct constants {
        static let cornerRadius: CGFloat = 12
        static let lineWidth: CGFloat = 2
    }
}

extension View {
    func transformIntoCard(isFaceUp: Bool) -> some View {
        modifier(TransformIntoCard(isFaceUp: isFaceUp))
    }
}
