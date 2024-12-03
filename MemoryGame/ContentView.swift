//
//  ContentView.swift
//  MemoryGame
//
//  Created by student on 22/10/2024.
//

import SwiftUI


struct ContentView: View {
    @ObservedObject var viewModel: MemoGameViewModel
    
    
    // cg rec ma frame i center
    
    
    //add line
    //add arc
    // stroke/fill wypelniamy
    
    // protokol shake?
    
    
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
        let bottomCardColumns = [GridItem(.adaptive(minimum: 50))]
        
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
