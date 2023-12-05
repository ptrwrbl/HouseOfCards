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
