import SwiftUI

class MemoGameViewModel : ObservableObject {
    private static let decks: [[String]] = [
        ["🎑", "🌇", "🌠", "🌉"],
        ["🐶", "🐱", "🐭", "🦊", "🐼", "🐨", "🦁", "🐸"],
        ["😈", "👻", "️☠️", "🎃", "🕷️", "🕸️"]
    ]
    private static var themes = [
        0: (4, decks[0]),
        1: (8, decks[1]),
        2: (6, decks[2])
    ]
    private let colors: [Color] = [Color.blue, Color.green, Color.orange]
    var currentTheme = Color.blue
    var icons: [String] = ["repeat", "heart", "star"]
    
    @Published private var model: MemoGameModel<String> = MemoGameViewModel.createMemoGame(0)
   
    private static func createMemoGame(_ theme: Int) -> MemoGameModel<String> {
        let pairs = themes[theme]!.0
        let emojis = themes[theme]!.1
        
        return MemoGameModel<String>(numberPairsOfCard: pairs) { index in
            if emojis.indices.contains(index) {
                return emojis[index]
            }
            return "??"
        }
    }

    var cards: Array<MemoGameModel<String>.Card> {
        return model.cards
    }

    func choose(_ card: MemoGameModel<String>.Card) {
        model.choose(card)
    }
    
    func shuffle() {
        model.shuffle()
    }
    
    func changeTheme(newTheme: Int) {
        currentTheme = colors[newTheme]
        model = MemoGameViewModel.createMemoGame(newTheme)
    }
    
}
