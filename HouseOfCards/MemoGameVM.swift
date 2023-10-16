//
//  MemoGameVM.swift
//  HouseOfCards
//
//  Created by Piotr Wróbel on 16/10/2023.
//

import SwiftUI

class MemoGameVM {
   private static let emojis = ["😈", "👻", "️☠️", "🎃", "🕷️", "🕸️", "😱", "🍭", "💀"]

    private var model: MemoGame<String> = MemoGameVM.createMemoGame()
   
   static func createMemoGame() -> MemoGame<String> {
      return MemoGame<String>(
         numberPairsOfCard: 4) {index in
            return emojis[index]
         }
   }

   var cards: Array<MemoGame<String>.Card> {
      return model.cards
   }

   func choose(card: MemoGame<String>.Card) {
      model.choose(card: card)
   }
}
