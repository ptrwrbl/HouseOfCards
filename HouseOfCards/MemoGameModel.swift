import Foundation

struct MemoGameModel<CardContent> where CardContent: Equatable {
    private(set) var cards : Array<Card>

    init(numberPairsOfCards: Int, cardContentFactory: (Int)->CardContent) {
        cards = []

        for pairIndex in 0..<max(2, numberPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex+1)a"))
            cards.append(Card(content: content, id: "\(pairIndex+1)b"))
        }
    }
    
    var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            cards.indices.filter{ index in cards[index].isFaceUp }.only
        }
        set {
            return cards.indices.forEach {
                cards[$0].isFaceUp = (newValue == $0)
            }
        }
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
                if let potentialMatch = indexOfOneAndOnlyFaceUpCard {
                    if cards[chosenIndex].content == cards[potentialMatch].content {
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatch].isMatched = true
                    }
                } else {
                    indexOfOneAndOnlyFaceUpCard = chosenIndex
                }
                cards[chosenIndex].isFaceUp = true
            }
        }
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

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
