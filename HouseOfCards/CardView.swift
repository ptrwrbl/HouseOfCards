import SwiftUI

struct CardView : View {
    var card: MemoGameModel<String>.Card
    
    init(_ card: MemoGameModel<String>.Card) {
        self.card = card
    }

    var body: some View {
        CirclePart(endAngle: .degrees(240))
            .overlay(
                Text(card.content)
                .font(.system(size: 200))
                .minimumScaleFactor(0.01)
                .aspectRatio(1/1, contentMode: .fit)
                .rotationEffect(.degrees(card.isMatched ? 360 : 0))
                .animation(.spin(duration: 2), value: card.isMatched)
            )
            .modifier(TransformIntoCard(isFaceUp: card.isFaceUp))
            .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}

extension Animation {
    static func spin(duration: TimeInterval) -> Animation {
        .linear(duration: duration).repeatForever(autoreverses: false)
    }
}
