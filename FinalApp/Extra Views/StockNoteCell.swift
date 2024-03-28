//
//  StockNoteCell.swift
//  FinalApp
//
//  Created by Tallon Pelikan on 3/27/24.
//

import SwiftUI

struct StockNoteCell: View {
    let stock: Stock
    let stockNotes: String
    var body: some View {
        HStack{
            Text("\(stockNotes)")
                .frame(width:225,height:50)
                .background(Color("StockCellTicker"))
                .cornerRadius(2.0)
                .font(.title3)
            Spacer()
            VStack{
                if (stock.gains<0){
                    Text(String(format:"P/L:  $%.2f", stock.gains))
                        .foregroundStyle(.red)
                }else{
                    Text(String(format:"P/L:  $%.2f", stock.gains))
                        .foregroundStyle(.green)
                }
                Text("12/6/23")
            }
            .padding(.trailing)
        }
        .background(Color("StockCell"))
        .padding()
    }
}

//#Preview {
//    StockNoteCell(stock: Stock(gains: 100, notes: ["Big Drops","hello"], ticker: "Facebook"),stockNotes: "I do pretty good today")
//}
