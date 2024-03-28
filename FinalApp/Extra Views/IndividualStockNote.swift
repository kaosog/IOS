//
//  IndividualStockNote.swift
//  FinalApp
//
//  Created by Tallon Pelikan on 3/27/24.
//

import SwiftUI

struct IndividualStockNote: View {
    var stock: Stock
    var Note: NotesDaily
    
    var body: some View {
        VStack{
            Text("12/6/29")
                .padding()
            Spacer()
            ZStack{
                Text(Note.notes)
            }
            .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height-150)
            .background(Color("NotePad"))
        }
    }
}

#Preview {
    IndividualStockNote(stock: Stock(gains: 100, notes: [NotesDaily(note: "Tried"),NotesDaily(note: "Failure")], ticker: "Facebook"),Note: NotesDaily(note: "Failure"))
}
