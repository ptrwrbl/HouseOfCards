//
//  ContentView.swift
//  HouseOfCards
//
//  Created by Piotr Wróbel on 16/10/2023.
//

import SwiftUI

struct ContentView : View {
    let emojis = ["😈", "👻", "️☠️", "🎃", "🕷️", "🕸️", "😱", "🍭", "💀"]
    @State var cardCount = 4
     
    var body: some View {
        VStack {
            ScrollView {
                cardDisplay
            }
            cardsCountAdjuster
        }
        .padding()
    }

    
    var cardDisplay : some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]){
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
    }
    
    var cardsCountAdjuster : some View {
        HStack {
            cardsAdder
            Spacer()
            cardsRemover
        }
    }
    
    var cardsAdder : some View {
        adjustCardNumber(offset: 2, symbol: "+")
    }
    
    var cardsRemover : some View {
        adjustCardNumber(offset: 2, symbol: "-")
    }

    func adjustCardNumber(offset: Int, symbol: String) -> some View {
        if symbol == "+" {
            return AnyView(
                Button(symbol) { cardCount += offset }
                    .disabled(cardCount + offset > emojis.count ? true : false)
            )
        }
        if symbol == "-" {
            return AnyView(
                Button(symbol) { cardCount -= offset }
                    .disabled(cardCount > offset ? false : true)
            )
        }
        return AnyView(Button(symbol) {})
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
