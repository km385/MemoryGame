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
                mainCard?.isFaceUp = true
            }
        }
        cards.shuffle()
        
    }

    private func indexOfFaceUp(card: Card) -> Int?{
        for index in cards.indices {
            if cards[index].isFaceUp {
                if cards[index].id != card.id {
                    return index
                }
            }
        }
        return nil
    }
    
    private func index(of card: Card) -> Int? {
        for index in cards.indices {
            if(cards[index].id == card.id) {
                return index
            }
        }
        return nil
    }
    
    
    mutating func choose(card: Card) {
        // set the previously clicked card as face down
        if let faceUpIndex = indexOfFaceUp(card: card) {
            cards[faceUpIndex].isFaceUp = false
        }
        
        // set the new card as faceup and match to card if identicle
        if let cardIndex = index(of: card) {
            cards[cardIndex].isFaceUp = true
            
            
            if cards[cardIndex].content == mainCard!.content {
                cards[cardIndex].isMatched = true
                mainCard?.isMatched = true
                for index in cards.indices {
                    if !cards[index].isMatched {
                        cards[index].visible = false
                    }
                }
                
            }
            
                   
            
        }
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
 
    struct Card: Equatable, Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var visible: Bool = true
        let content: CardContent
        var id: String
        var hasBeenSeen = false
    }
}
