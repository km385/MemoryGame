//
//  MemoGameModel.swift
//  MemoryGame
//
//  Created by student on 05/11/2024.
//

import Foundation

struct MemoGameModel<CardContent> where CardContent : Equatable {
    private(set) var cards: Array<Card>
    private(set) var mainCard: Card? = nil
    private(set) var score = 0
    
    init(numberOfCards: Int, cardContentFactory: (Int)-> CardContent) {
        cards = []
        let mainCardNumber = Int.random(in: 0..<numberOfCards)
        
            
        for pairIndex in 0..<numberOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(UUID())_a"))
//            cards.append(Card(content: content, id: "\(UUID())_b"))
            if(mainCardNumber == pairIndex) {
                mainCard = Card(content: content, id: "\(UUID())_b")
            }
        }
        cards.shuffle()
        
    }
    
    
    mutating func choose(_ card: Card) {
        
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
 
    struct Card: Equatable, Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        let content: CardContent
        var id: String
        var hasBeenSeen = false
    }
}
