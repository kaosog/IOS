//
//  StocksImage.swift
//  FinalApp
//
//  Created by Tallon Pelikan on 3/4/24.
//

import SwiftUI
import Charts

struct StocksImage: View {
    var body: some View {
            NavigationStack{
                VStack {
                    Chart{
                        ForEach(candle){item in
                            RectangleMark(x: .value("Day",item.day),yStart: .value("Low Price", item.lowPrice), yEnd: .value("High Price", item.highPrice),width: 4)
                                .foregroundStyle(item.color)
                                .opacity(0.4)
                            RectangleMark(x: .value("Day",item.day),yStart: .value("Open Price", item.openPrice), yEnd: .value("close Price", item.closePrice),width: 12)
                                .foregroundStyle(item.color)
                        }
                    }
                    .background(Color.black)
                    .padding()
                }
                .background(Color.black)
                //.navigationTitle("Account")
            }
        }
        }


        struct Candle: Identifiable{
        var id = UUID().uuidString
        var name: String
        var day: Int
        var lowPrice: Double
        var highPrice: Double
        var openPrice: Double
        var closePrice: Double
            var color: Color
        }

        var candle: [Candle] = [
            Candle(name: "Stocks", day: 1, lowPrice: 1, highPrice: 5, openPrice: 2, closePrice: 4,color:Color.green),
        Candle(name: "Stocks", day: 2, lowPrice: 4, highPrice: 10, openPrice: 4, closePrice: 9,color:Color.green),
        Candle(name: "Stocks", day: 3, lowPrice: 9, highPrice: 15, openPrice: 9, closePrice: 13,color:Color.green),
        Candle(name: "Stocks", day: 4, lowPrice: 4, highPrice: 13, openPrice: 13, closePrice: 5,color:Color.red),
            Candle(name: "Stocks", day: 5, lowPrice: 1, highPrice: 5, openPrice: 5, closePrice: 3,color:Color.red),
            Candle(name: "Stocks", day: 6, lowPrice: 4, highPrice: 10, openPrice: 4, closePrice: 9,color:Color.green),
            Candle(name: "Stocks", day: 7, lowPrice: 2, highPrice: 9, openPrice: 9, closePrice: 3,color:Color.red),
            Candle(name: "Stocks", day: 8, lowPrice: 2, highPrice: 7, openPrice: 3, closePrice: 4,color:Color.green)]
    


#Preview {
    StocksImage()
}
