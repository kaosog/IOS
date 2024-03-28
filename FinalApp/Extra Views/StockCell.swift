//
//  StockCell.swift
//  FinalApp
//
//  Created by Tallon Pelikan on 3/27/24.
//

import SwiftUI

struct StockCell: View {
    let stock: Stock
    var body: some View {
        HStack{
            Text("\(stock.ticker)")
                .frame(width:225,height:50)
                .background(Color("StockCellTicker"))
                .cornerRadius(2.0)
                .font(.largeTitle)
                .bold()
            Spacer()
            VStack{
                if (stock.gains<0){
                    Text(String(format:"P/L:  $%.2f", stock.gains))
                        .foregroundStyle(.red)
                }else{
                    Text(String(format:"P/L:  $%.2f", stock.gains))
                        .foregroundStyle(.green)
                }
            }
            .padding(.trailing)
        }
        .background(Color("StockCell"))
        .padding()
    }
}

#Preview {
    StockCell(stock: Stock(gains: 100, notes: [NotesDaily(note: "Tried"),NotesDaily(note: "Failure")], ticker: "Facebook"))
}
