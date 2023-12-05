import SwiftUI

struct ContentView : View {
    @ObservedObject var viewModel: MemoGameViewModel
    
    var colors: [Color] = [Color.blue, Color.green, Color.orange]
    var icons: [String] = ["repeat", "heart", "star"]
     
    var body: some View {
        VStack {
            Text("Memo")
                .font(.largeTitle)
            ScrollView {
                cardDisplay(elems: viewModel, minWidthSize: 80)
            }
            HStack {
                score
                Spacer()
                shuffle
            }
            .padding()
            .foregroundColor(viewModel.currentTheme)
            themeSelector
        }
        .padding()
    }

    var score : some View {
        return Text("Score: \(viewModel.score)")
            .font(.largeTitle)
    }
    
    var shuffle : some View {
        return Button("SHUFFLE") {
            withAnimation(.easeInOut(duration: 2)) {
                viewModel.shuffle()
            }
        }
    }
    
    func cardDisplay(elems: MemoGameViewModel, minWidthSize: CGFloat) -> some View {
        return LazyVGrid(columns: [GridItem(.adaptive(minimum: minWidthSize), spacing: 0)], spacing: 0){
            ForEach(elems.cards) { card in
                CardView(card)
                .aspectRatio(2/3, contentMode: .fit)
                .padding(4)
                .onTapGesture{ elems.choose(card) }
            }
        }
        .foregroundColor(viewModel.currentTheme)
    }
    
    var themeSelector : some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]){
            ForEach(0..<colors.count, id: \.self) { value in
                ThemeButtonView(viewModel: viewModel, icon: icons[value], colour: colors[value], theme: value)
            }
        }
        .foregroundColor(viewModel.currentTheme)
    }
}
