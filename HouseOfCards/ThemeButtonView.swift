//
//  ThemeButtonView.swift
//  HouseOfCards
//
//  Created by student on 17.10.2023.
//

import SwiftUI

struct ThemeButtonView: View {
    let icon: String
    let content: String
    let onChange: (String)->Void
    
    var body: some View {
        Button {
            
        } label: {
            VStack {
                Image(systemName: icon)
                    .imageScale(.large)
                Text(content)
                    .font(.caption)
            }
        }
        .onTapGesture{
            onChange(content)
        }
    }
    
    
}

#Preview {
    ThemeButtonView(icon: "globe", content: "Motyw", onChange: {desTheme in})
}
