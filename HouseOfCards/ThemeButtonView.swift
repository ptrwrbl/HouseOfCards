import SwiftUI

struct ThemeButtonView: View {
    @ObservedObject var viewModel: MemoGameViewModel
    
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
