//
//  ContentView.swift
//  MemoryGame
//
//  Created by student on 22/10/2024.
//

import SwiftUI

struct ContentView: View {
    var contentTab = ["🐶", "🐱", "🐼", "🐨", "🦊", "🐯", "🦁", "🐸"]
    var contentTab2 = ["🍎", "🍕", "🌮", "🍦", "🍪", "🥨"]
    var contentTab3 = ["☀️", "🌙", "⭐️", "🌈"]
    
    @State var isButtonDisabled1 = false
    @State var isButtonDisabled2 = false
    
    @State var numberOfCards: Int = 8
    @State var themeColor:Color = .blue
    @State var themeNumber: Int = 2
    
    
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
        return HStack {
            ButtonView(ownColor: .green, themeColor: $themeColor, themeNumber: $themeNumber)
            Spacer()
            ButtonView(ownColor: .red,themeColor: $themeColor, themeNumber: $themeNumber)
            Spacer()
            ButtonView(ownColor: .blue,themeColor: $themeColor, themeNumber: $themeNumber)
        }
         
    }
    
    func changeTheme() -> (Array<String>, Int) {
        if(themeNumber == 1) {
            return (contentTab.shuffled(), contentTab.count)
        } else if (themeNumber == 2) {
            return (contentTab2.shuffled(), contentTab2.count)
        } else {
            return (contentTab3.shuffled(), contentTab3.count)
        }
        
    }
    
    var cardDisplay: some View {
            let columns = [GridItem(.adaptive(minimum: 120))]

            return ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(0..<numberOfCards, id: \.self) { index in
                        CardView(state: true, emoji: contentTab[index], fillColor: themeColor)
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
            buttonDisplay
               
            
            
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
