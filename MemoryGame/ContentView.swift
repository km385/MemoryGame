//
//  ContentView.swift
//  MemoryGame
//
//  Created by student on 22/10/2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: MemoGameViewModel
    
    @State var isButtonDisabled1 = false
    @State var isButtonDisabled2 = false
    
    @State var numberOfCards: Int = 8
    @State var themeColor:Color = .blue
    @State var themeNumber: Int = 2
    
    
//    func adjustCardNumber(by offset: Int, symbol: String) -> some View {
//        let newCount = numberOfCards + offset
//        if newCount < 2 {
//            isButtonDisabled2 = true
//        } else if newCount > contentTab.count {
//            isButtonDisabled1 = true
//        } else {
//            numberOfCards = newCount
//            isButtonDisabled1 = false
//            isButtonDisabled2 = false
//        }
//        return EmptyView()
//    }
    
    var buttonDisplay: some View {
        return HStack {
            ButtonView(viewModel: viewModel, ownColor: .orange)
            Spacer()
            ButtonView(viewModel: viewModel, ownColor: .blue)
            Spacer()
            ButtonView(viewModel: viewModel, ownColor: .red)
        }
         
    }
    
//    func chooseCard(cardId: v) {
//        
//    }
    
    
    var cardDisplay: some View {
            let columns = [GridItem(.adaptive(minimum: 120))]

            return ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    // main card
                    CardView(card: viewModel.mainCard, color: viewModel.themeColor)
                        .aspectRatio(2/3, contentMode: .fit)
                    Spacer()
                    // the rest
                    ForEach(viewModel.cards) { card in
                        CardView(card: card, color: viewModel.themeColor)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
                .padding()
            }
        }
    
    
    var body: some View {
        VStack {
            Text("Memo").font(.largeTitle)
            cardDisplay
            Spacer()
            buttonDisplay
            
            
        }
        .padding()
    }
    
    
}

#Preview {
    ContentView(viewModel: MemoGameViewModel())
}
