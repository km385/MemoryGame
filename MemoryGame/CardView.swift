//
//  CardView.swift
//  MemoryGame
//
//  Created by student on 22/10/2024.
//

import SwiftUI

struct CardView: View {
    var card: MemoGameModel<String>.Card
    var color: Color = .blue
    
    var body: some View {
        Group {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(color, lineWidth: 2)
                    .font(.largeTitle)
                    .frame(width: 150,height: 150)
                
                Text(card.content)
                    .opacity(1)
                    .font(Font.largeTitle)
                    .aspectRatio(2/3, contentMode: .fit)
                    .minimumScaleFactor(0.01)
            }
            
            
            
        }
        
            
        
    }
}

#Preview {
    CardView(card: MemoGameModel<String>.Card(isFaceUp: true, isMatched: false, content: "1", id: "2"))
}
