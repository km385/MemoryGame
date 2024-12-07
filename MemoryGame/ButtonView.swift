//
//  ButtonView.swift
//  MemoryGame
//
//  Created by student on 29/10/2024.
//

import SwiftUI

struct ButtonView: View {
    @ObservedObject var viewModel: MemoGameViewModel
    var imageName = "smiley"
    var text = "test"
    var ownNumber = 0
    var ownColor = Color.blue
    
    var body: some View {
        Button(action: {
            viewModel.chooseTheme(color: ownColor)
        }, label: {
            VStack{
                Image(systemName: imageName)
                    .font(.largeTitle)
                Text(text)
                    .font(.largeTitle)
            }
            .foregroundColor(ownColor)
                
            
        })
       
    }
}

#Preview {
    ButtonView(viewModel: MemoGameViewModel())
}
