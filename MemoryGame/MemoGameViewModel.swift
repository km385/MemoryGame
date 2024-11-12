//
//  MemoGameViewModel.swift
//  MemoryGame
//
//  Created by student on 05/11/2024.
//

import Foundation
import SwiftUI

class MemoGameViewModel : ObservableObject {
    
    
    private static let emojis: [Color: [String]] = [
            Color.orange: ["🍇", "🍈", "🥑", "🍉", "🍏", "🍐", "🍊", "🍎"],
            Color.blue: ["🐻", "🐻‍❄️", "🐼", "🐶", "🦊", "🦁", "🐯", "🐵", "🙈"],
            Color.red: ["🤣", "😂", "😜", "🤠", "😈", "👻", "🤖"]
        ]
    
    
    private static func createMemoGame(color: Color = .orange) -> MemoGameModel<String> {
            guard let pairCount = emojis[color]?.count else {
                fatalError("Emojis for color not found")
            }
        return MemoGameModel<String>(numberOfCards: pairCount) { index in
                if let themeEmojis = emojis[color], themeEmojis.indices.contains(index) {
                    return themeEmojis[index]
                }
                else {
                    return "??"
                }
            }
        }
    
    @Published var model = createMemoGame()
    var themeColor: Color = .orange
    var cards: Array<MemoGameModel<String>.Card> { model.cards }
    var mainCard: MemoGameModel<String>.Card {
        model.mainCard!
    }
    func choose(card: MemoGameModel<String>.Card) {
        model.choose(card)
    }
    
    func chooseTheme(color: Color) {
        themeColor = color
        model = MemoGameViewModel.createMemoGame(color: color)
    }
}
