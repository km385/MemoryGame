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
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.stroke(color, lineWidth: 2)
                    
                Text(card.content).font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill(color).opacity(card.isFaceUp ? 0 : 1)
        }.opacity(card.visible ? 1:0)
        
    }

}


#Preview {
    CardView(card: MemoGameModel<String>.Card(isFaceUp: true, isMatched: false, content: "1", id: "2"))
}
