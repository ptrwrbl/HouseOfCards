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
                .aspectRatio(1/1, contentMode: .fit))
            .modifier(TransformIntoCard(isFaceUp: card.isFaceUp))
            .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}
