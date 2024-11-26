//
//  ContentView.swift
//  MemoryGame
//
//  Created by student on 22/10/2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: MemoGameViewModel
    
    
    
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
        
        let topCardColumns = [GridItem(.flexible())]
        let bottomCardColumns = [GridItem(.adaptive(minimum: 40))]

        return ScrollView {
            VStack(spacing: 20) {
                LazyVGrid(columns: topCardColumns, spacing: 20) {
                    CardView(card: viewModel.mainCard, color: viewModel.themeColor)
                        
                        
                }

                LazyVGrid(columns: bottomCardColumns, spacing: 20) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card, color: viewModel.themeColor)
                            .onTapGesture {
                                viewModel.choose(card: card)
                                    
                            }  
                    }
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
