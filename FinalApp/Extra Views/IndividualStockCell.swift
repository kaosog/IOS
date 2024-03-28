//
//  IndividualStockCell.swift
//  FinalApp
//
//  Created by Tallon Pelikan on 3/27/24.
//

import SwiftUI

struct IndividualStockCell: View {
    var stock: Stock
    var String: NotesDaily
    var body: some View {
        HStack{
            Text("\(String.notes)")
                .padding()
            Spacer()
            Text("12/9/23")
                
        }
    }
}

#Preview {
    IndividualStockCell(stock: Stock(gains: 100, notes: [NotesDaily(note: "Tried"),NotesDaily(note: "Failure")], ticker: "Facebook"),String: NotesDaily(note: "Failure"))
}
