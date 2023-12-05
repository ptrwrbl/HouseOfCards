import Foundation
import SwiftUI

class MemoGameViewModel : ObservableObject {
    var currentTheme = Color.blue
    private static var themes: [Int: (Int, [String])] = [
        0: (4, ["🎑", "🌇", "🌠", "🌉"]),
        1: (8, ["🐶", "🐱", "🐭", "🦊", "🐼", "🐨", "🦁", "🐸"]),
        2: (6, ["😈", "👻", "️☠️", "🎃", "🕷️", "🕸️"])
    ]
   
    private static func createMemoGame(_ theme: Int) -> MemoGameModel<String> {
        let pairs = themes[theme]!.0
        let deck = themes[theme]!.1
        
        return MemoGameModel<String>(numberPairsOfCards: pairs) { index in
            if deck.indices.contains(index) {
                return deck[index]
            }
            return "??"
        }
    }
    
    func shuffle() {
        model.shuffle()
    }
    
    @Published private var model = MemoGameViewModel.createMemoGame(0)
    
    var cards: Array<MemoGameModel<String>.Card> {
        return model.cards
    }
    
    
    
    var score: Int {
        model.score
    }

    func choose(_ card: MemoGameModel<String>.Card) {
        withAnimation {
            model.choose(card)
        }
    }
    
    func changeTheme(_ newTheme: Int, color: Color) {
        currentTheme = color
        model = MemoGameViewModel.createMemoGame(newTheme)
        withAnimation(.easeInOut(duration: 2)) {
            shuffle()
        }
    }
    
}
