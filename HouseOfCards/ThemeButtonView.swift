//
//  ThemeButtonView.swift
//  HouseOfCards
//
//  Created by student on 17.10.2023.
//

import SwiftUI

struct ThemeButtonView: View {
    @Binding var theme: Int
    @Binding var count: Int
    let color: Color
    let icon: String
    let desiredTheme: Int
    let desiredPairs: Int
    
    var body: some View {
        Button {
            theme = desiredTheme
            count = 2 * desiredPairs
        } label: {
            VStack {
                Image(systemName: icon)
                    .imageScale(.large)
                Text("Motyw " + (String)(desiredTheme + 1))
                    .font(.caption)
            }
        }
    }
    
    
}

#Preview {
    ThemeButtonView(theme: .constant(0), count: .constant(2), color: .red,  icon: "globe", desiredTheme: 1, desiredPairs: 2)
}
