//
//  ContentView.swift
//  MemoryGame
//
//  Created by student on 22/10/2024.
//

import SwiftUI


struct ContentView: View {
    @ObservedObject var viewModel: MemoGameViewModel
    
    
    var buttonDisplay: some View {
        return HStack {
            ButtonView(viewModel: viewModel, text: "faces", ownColor: .orange)
                
            Spacer()
            
            ButtonView(viewModel: viewModel,imageName: "pawprint.fill", text: "animals", ownColor: .blue)
            Spacer()
            
            ButtonView(viewModel: viewModel, text: "other", ownColor: .red)
        }
        
    }
    
    
    var mainCard: some View {
        CardView(card: viewModel.mainCard, color: viewModel.themeColor)
            .aspectRatio(contentMode: .fit)
            .frame( height: 400)
    }
    
    var cards: some View {
        ForEach(viewModel.cards) { card in
            CardView(card: card, color: viewModel.themeColor)
                .aspectRatio(contentMode: .fit)
                .onTapGesture {
                    viewModel.choose(card: card)
                }
            
            
            
        }
    }
  
    var cardDisplay: some View {
        
//        let topCardColumns = [GridItem(.flexible())]
        let bottomCardColumns = [GridItem(.adaptive(minimum: 120))]
        
        return ScrollView {
            VStack(spacing: 20) {

                mainCard
                    
                LazyVGrid(columns: bottomCardColumns, spacing: 20) {
                    cards
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
