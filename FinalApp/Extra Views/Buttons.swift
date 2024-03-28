//
//  Buttons.swift
//  FinalApp
//
//  Created by Tallon Pelikan on 3/4/24.
//

import SwiftUI

struct Buttons: View {
    @Binding var information: Accounts
    var text:String
    var body: some View {
        Button(text){
            information.log()
        }
        .background(Color.black)
    }
}


