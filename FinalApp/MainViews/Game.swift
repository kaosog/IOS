//
//  Game.swift
//  FinalApp
//
//  Created by Tallon Pelikan on 3/27/24.
//

import SwiftUI

struct Game: View {
    var body: some View {
        VStack{
            Spacer()
            Image("Image")
                .frame(width: UIScreen.main.bounds.width/1.5,height: UIScreen.main.bounds.height/2)
                .background(Color.black)
            Spacer()
            HStack{
                Button(action: {
                 }) {
                     // Button label
                     Text("BULLISH")
                         .frame(minWidth: 200,minHeight: 75)
                         .background(Color.green)
                         .cornerRadius(10)
                         .foregroundColor(.black)
                 }
                Button(action: {
                 }) {
                     // Button label
                     Text("BEARISH")
                         .frame(minWidth: 200,minHeight: 75)
                         .background(Color.red)
                         .cornerRadius(10)
                         .foregroundColor(.black)
                 }
            }
            Spacer()
        }
    }
}

#Preview {
    Game()
}
