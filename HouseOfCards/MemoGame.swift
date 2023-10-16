//
//  MemoGame.swift
//  HouseOfCards
//
//  Created by Piotr Wróbel on 16/10/2023.
//

import Foundation

struct MemoGame<CardContent> {
   private(set) var cards : Array<Card>

   init(numberPairsOfCard: Int, cardContentFactory: (Int)->CardContent) {
      cards = []

      for pairIndex in 0..<numberPairsOfCard {
         let content = cardContentFactory(pairIndex)
         cards.append(Card(content: content))
         cards.append(Card(content: content))
      }
   }
   func choose(card: Card) {

   }

   struct Card {
      var isFaceUp : Bool = false
      var isMatched : Bool = false
      var content: CardContent
   }
}
