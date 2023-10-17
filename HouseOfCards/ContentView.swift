//
//  ContentView.swift
//  HouseOfCards
//
//  Created by Piotr Wróbel on 16/10/2023.
//

import SwiftUI

struct ContentView : View {
    let emojis = ["😈", "👻", "️☠️", "🎃", "🕷️", "🕸️", "😱", "🍭", "💀", "😈", "👻", "️☠️", "🎃", "🕷️", "🕸️", "😱", "🍭", "💀"]
    
    @State var theme : Color = Color(.blue)
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
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]){
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(theme)
    }
    
    var themeSelector : some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]){
            themeSelector1
            themeSelector2
            themeSelector3
        }
        .foregroundColor(theme)
    }
    
    var themeSelector1 : some View {
        ThemeButtonView(icon: "repeat", content: "Motyw 1", onChange: changeTheme)
    }
    
    var themeSelector2 : some View {
        ThemeButtonView(icon: "star", content: "Motyw 2", onChange: changeTheme)
    }
        
    var themeSelector3 : some View {
        ThemeButtonView(icon: "heart", content: "Motyw 3", onChange: changeTheme)
    }
    
    func changeTheme(_ desiredTheme: String) {
        if desiredTheme == "Motyw 1" {
            theme = Color(.blue)
            cardCount = 8
        }
        if desiredTheme == "Motyw 2" {
            theme = Color(.orange)
            cardCount = 16
        }
        if desiredTheme == "Motyw 3" {
            theme = Color(.green)
            cardCount = 12
        }
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
