import Foundation

struct MemoGameModel<CardContent> where CardContent: Equatable {
    private(set) var cards : Array<Card>

    init(numberPairsOfCard: Int, cardContentFactory: (Int)->CardContent) {
        cards = []

        for pairIndex in 0..<max(2, numberPairsOfCard) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex+1)a"))
            cards.append(Card(content: content, id: "\(pairIndex+1)b"))
        }
    }
    
    mutating func choose(_ card: Card) {
        let chosenIndex = index(of: card)
        cards[chosenIndex].isFaceUp.toggle()
    }
    
    func index(of card: Card) -> Int {
        for index in cards.indices {
            if (cards[index].id == card.id) {
                return index
            }
        }
        return 0
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }

    struct Card: Equatable, Identifiable {
        var isFaceUp : Bool = false
        var isMatched : Bool = false
        var content: CardContent
        
        var id: String
   }
}
