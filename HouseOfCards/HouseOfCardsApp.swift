//
//  HouseOfCardsApp.swift
//  HouseOfCards
//
//  Created by Piotr Wróbel on 16/10/2023.
//

import SwiftUI

@main
struct HouseOfCardsApp: App {
    @StateObject var vm = MemoGameViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: vm)
        }
    }
}
