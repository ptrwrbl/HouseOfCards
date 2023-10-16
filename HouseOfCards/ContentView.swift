//
//  ContentView.swift
//  HouseOfCards
//
//  Created by Piotr Wróbel on 16/10/2023.
//

import SwiftUI

struct ContentView : View {
    // var viewModel: MemoGameVM
    let emojis = ["😈", "👻", "️☠️", "🎃", "🕷️", "🕸️", "😱", "🍭", "💀"]
    @State var cardCount = 4

    var body: some View {

      VStack {
         ScrollView {
            cards
         }
      }
      .padding()
   }

   var cards : some View {
      LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]){
         ForEach(0..<cardCount, id: \.self) { index in
            CardView(content: emojis[index])
            .aspectRatio(2/3, contentMode: .fit)
         }
      }
      .foregroundColor(.orange)
   }
}

struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}
