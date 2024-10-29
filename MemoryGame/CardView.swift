//
//  CardView.swift
//  MemoryGame
//
//  Created by student on 22/10/2024.
//

import SwiftUI

struct CardView: View {
    @State var state: Bool
    var emoji: String = "🐶"
    @State var opacity: Double = 1
    @State var fillColor: Color = .white
    var body: some View {
        Group {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.blue, lineWidth: 2)
                    .fill(fillColor)
                    .font(.largeTitle)
                    .frame(width: 150,height: 150)
                
                Text(emoji)
                    .opacity(opacity)
                    .font(.largeTitle)
            }
            
            
            
        }
        .onTapGesture {
            if state {
                opacity = 1
                fillColor = .white
            } else {
                opacity = 0
                fillColor = .blue
            }
            state = !state
        }
        
            
        
    }
}

#Preview {
    CardView(state: true, emoji: "emojiTest")
}
