import SwiftUI

struct ThemeButtonView: View {
    @ObservedObject var viewModel: MemoGameViewModel
    
    let icon: String
    var colour: Color
    var theme: Int
    
    var body: some View {
        Button {
            viewModel.changeTheme(theme, color: colour)
        } label: {
            VStack {
                Image(systemName: icon)
                    .imageScale(.large)
                Text("Motyw " + (String)(theme + 1))
                    .font(.caption)
            }
        }
    }
}
