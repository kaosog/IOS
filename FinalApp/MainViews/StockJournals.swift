//
//  StockJournals.swift
//  FinalApp
//
//  Created by Tallon Pelikan on 3/27/24.
//

import SwiftUI

struct StockJournals: View {
    @State
    var Stocks: [Stock] = [
        Stock(gains: 100.00, notes: [NotesDaily(note: "Tried"),NotesDaily(note: "Failure")], ticker: "Tesla"),
        Stock(gains: -200, notes: [NotesDaily(note: "Tried"),NotesDaily(note: "Failure")],ticker: "Facebook"),
        Stock(gains: 300, notes: [NotesDaily(note: "Tried"),NotesDaily(note: "Failure")], ticker:"Apple")]
    var body: some View {
        NavigationView{
            List(Stocks){ stock in
                NavigationLink(destination:StockJournal(stock: stock.notes)){
                    StockCell(stock: stock)
                }
            }
            .navigationBarTitle("Top Stocks",displayMode:.large)
            .toolbar{
                NavigationLink(destination: AddStock()) {
                    Label("Add Stock", systemImage: "plus.app.fill")
                        .imageScale(.large)
                }
            }
            .padding(-10.0)
        }
        .listStyle(PlainListStyle())
    }
}

#Preview {
    StockJournals()
}
