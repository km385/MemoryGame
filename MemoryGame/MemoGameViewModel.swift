//
//  MemoGameViewModel.swift
//  MemoryGame
//
//  Created by student on 05/11/2024.
//

import Foundation

class MemoGameViewModel<CardContent> : ObservableObject {
    var contentCards: Array<CardContent> = []
    
    var contentTab = ["🐶", "🐱", "🐼", "🐨", "🦊", "🐯", "🦁", "🐸"]
    var contentTab2 = ["🍎", "🍕", "🌮", "🍦", "🍪", "🥨"]
    var contentTab3 = ["☀️", "🌙", "⭐️", "🌈"]

    @Published var model: MemoGameModel<String>
    
    
    init(theme: Int, numberOfCards: Int) {
        
        
    }
    
    func createModel() {
        
    }
}
