//
//  TransformIntoCard.swift
//  MemoryGame
//
//  Created by student on 03/12/2024.
//


import SwiftUI

struct TransformIntoCard: ViewModifier {
    var isFaceUp: Bool
    var color: Color
    func body(content: Content) -> some View {
        
        let base = RoundedRectangle(cornerRadius: 12)
        
        base.fill(isFaceUp ? .white : color)
            .overlay(
                content
                    .opacity(isFaceUp ? 1 : 0)
            )
            .background(
                base
                    .stroke(color, lineWidth: 2)
                    .background(base.fill().opacity(isFaceUp ? 0 : 1))
            )
            
            .rotation3DEffect(.degrees(isFaceUp ? 0 : 180), 
                              axis: (0,1,0))
            .animation(.easeInOut(duration: 0.5), value: isFaceUp)
        
            
    }
}

//struct TransformIntoCard: ViewModifier {
//    var isFaceUp: Bool
//    var color: Color
//    func body(content: Content) -> some View {
//        ZStack {
//            let base = RoundedRectangle(cornerRadius: 12)
//            base.fill(.white)
//                .stroke(color, lineWidth: 2)
//                .overlay(content)
//                .opacity(isFaceUp ? 1 : 0)
//            
////            base.strokeBorder(lineWidth: 4)
////                .background(base.fill(.white))
////                .overlay(content)
////                .opacity(isFaceUp ? 1 : 0)
//            
//            base.fill(color)
//                .opacity(isFaceUp ? 0 : 1)
//        }
//        .rotation3DEffect(.degrees(isFaceUp ? 0 : 180), axis: (0, 1, 0))
//        .animation(.easeInOut(duration: 1), value: isFaceUp)
//    }
//}
