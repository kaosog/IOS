//
//  IndividualStockCell.swift
//  FinalApp
//
//  Created by Tallon Pelikan on 3/27/24.
//

import SwiftUI

struct IndividualStockCell: View {
    var stock: Stock
    var String: String
    var body: some View {
        HStack{
            Text("\(String)")
                .padding()
            Spacer()
            Text("12/9/23")
                
        }
    }
}

#Preview {
    IndividualStockCell(stock: Stock(gains: 100, notes: String( "Tried"), ticker: "Facebook"),String: String("Failure"))
}
