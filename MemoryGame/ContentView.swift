//
//  ContentView.swift
//  MemoryGame
//
//  Created by student on 22/10/2024.
//

import SwiftUI

struct ContentView: View {
    var contentTab = ["🐶", "🐱", "🐼", "🐨","🐶", "🐱", "🐼", "🐨","🐶", "🐱", "🐼", "🐨"]
    @State var numberOfCards: Int = 6
    @State var isButtonDisabled1 = false
    @State var isButtonDisabled2 = false
    @State var color:Color = .blue
    @State var buttonNumber: Int = 4
    func adjustCardNumber(by offset: Int, symbol: String) -> some View {
        let newCount = numberOfCards + offset
        if newCount < 2 {
            isButtonDisabled2 = true
        } else if newCount > contentTab.count {
            isButtonDisabled1 = true
        } else {
            numberOfCards = newCount
            isButtonDisabled1 = false
            isButtonDisabled2 = false
        }
        return EmptyView()
    }
    
    var buttonDisplay: some View {
        return ButtonView(themeColor: $color, themeNumber: $buttonNumber)
    }
    
    var cardDisplay: some View {
            let columns = [GridItem(.adaptive(minimum: 120))]

            return ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(0..<numberOfCards, id: \.self) { index in
                        CardView(state: true, emoji: contentTab[index])
                            .foregroundColor(.blue)
                            .aspectRatio(2/3, contentMode: .fit)
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
            HStack{
                buttonDisplay
                Spacer()
                buttonDisplay
                Spacer()
                buttonDisplay
            }
            
//            HStack {
//                Button(action: {
//                    adjustCardNumber(by: 2, symbol: "")
//                }) {
//                    Text("+")
//                }
//                .disabled(isButtonDisabled1)
//                Spacer()
//                Button(action: {
//                    adjustCardNumber(by: -2, symbol: "")
//                }) {
//                    Text("-")
//                }
//                .disabled(isButtonDisabled2)
//            }
            
        }
        .padding()
    }
    
    
}

#Preview {
    ContentView()
}
