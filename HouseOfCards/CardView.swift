//
//  CardView.swift
//  HouseOfCards
//
//  Created by Piotr Wróbel on 16/10/2023.
//

import SwiftUI

struct CardView : View {
   let content: String
   @State var isFaceUp : Bool = false

      var body: some View {
      ZStack {
         let base = RoundedRectangle(cornerRadius: 12)
         Group {
            base.fill(.white)
            base.strokeBorder(lineWidth: 3)
            Text(content).font(.largeTitle)
         }
         .opacity(isFaceUp ? 1 : 0)
         base.fill().opacity(isFaceUp ? 0 : 1)
      }
      .onTapGesture(perform: {
         isFaceUp.toggle()
      })
   }
}

#Preview {
    CardView(content: "♥️")
}
