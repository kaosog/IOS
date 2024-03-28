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
            Image("Image")
            padding()
            HStack{
                Text("BULLISH")
                    .frame(minWidth: 200,minHeight: 75)
                Text("BEARISH")
            }
        }
    }
}

#Preview {
    Game()
}
