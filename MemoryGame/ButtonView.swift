//
//  ButtonView.swift
//  MemoryGame
//
//  Created by student on 29/10/2024.
//

import SwiftUI

struct ButtonView: View {
    var imageName = ""
    var text = ""
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
                Image(systemName: "smiley")
                Text(imageName)
            })
            
        }
        
        
//        scribble.variable
//        pawprint.circle
    }
}

//#Preview {
//    ButtonView(themeColor: , themeNumber: )
//}
