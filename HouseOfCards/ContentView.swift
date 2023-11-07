//
//  ContentView.swift
//  HouseOfCards
//
//  Created by Piotr Wróbel on 16/10/2023.
//

import SwiftUI

struct ContentView : View {
    var emojis: [[String]] = [
        ["🎑", "🌇", "🌠", "🌉"],
        ["🐶", "🐱", "🐭", "🦊", "🐼", "🐨", "🦁", "🐸"],
        ["😈", "👻", "️☠️", "🎃", "🕷️", "🕸️"]
    ]
    
    var colors: [Color] = [Color.blue, Color.green, Color.orange]
    var icons: [String] = ["repeat", "heart", "star"]
    @State var theme = 0
    @State var cardCount = 8
     
    var body: some View {
        VStack {
            Text("Memo")
                .font(.largeTitle)
            ScrollView {
                cardDisplay
            }
            themeSelector
            // cardsCountAdjuster
        }
        .padding()
    }

    
    var cardDisplay : some View {
        let shuffledEmojis: [String] = shuffleCards()
        
        return LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]){
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: shuffledEmojis[index])
                .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(colors[theme])
    }
    
    var themeSelector : some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]){
            ForEach(0..<colors.count, id: \.self) { value in
                ThemeButtonView(theme: $theme, count: $cardCount, color: colors[value], icon: icons[value], desiredTheme: value, desiredPairs: emojis[value].count)
            }
        }
        .foregroundColor(colors[theme])
    }
    
    /* var themeSelector : some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]){
            theme1
            theme2
            theme3
        }
        .foregroundColor(colors[theme])
    }
    
    var theme1 : some View {
        ThemeButtonView(theme: $theme, count: $cardCount, color: colors[0], icon: icons[0], desiredTheme: 0, desiredPairs: emojis[0].count)
    }
    
    var theme2 : some View {
        ThemeButtonView(theme: $theme, count: $cardCount, color: colors[1], icon: icons[1], desiredTheme: 1, desiredPairs: emojis[1].count)
    }
    
    var theme3 : some View {
        ThemeButtonView(theme: $theme, count: $cardCount, color: colors[2], icon: icons[2], desiredTheme: 2, desiredPairs: emojis[2].count)
    } */
    
    func shuffleCards() -> [String] {
        let resultSet: [String] = emojis[theme] + emojis[theme]
        return resultSet.shuffled()
    }
    
    /* commented for Lab4
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
    } */
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
