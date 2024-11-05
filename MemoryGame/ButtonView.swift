//
//  ButtonView.swift
//  MemoryGame
//
//  Created by student on 29/10/2024.
//

import SwiftUI

struct ButtonView: View {
    var imageName = "smiley"
    var text = "test"
    var ownNumber = 0
    var ownColor = Color.blue
    
    @Binding var themeColor: Color
    @Binding var themeNumber: Int
    var body: some View {
        VStack{
            Button(action: {
                themeNumber = ownNumber
                themeColor = ownColor
            }, label: {
                VStack{
                    Image(systemName: imageName)
                        
                    Text(text)
                }.foregroundColor(ownColor)
                
            })
            
        }
        
        
//        scribble.variable
//        pawprint.circle
    }
}

//#Preview {
//    ButtonView(themeColor: , themeNumber: )
//}
