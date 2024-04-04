//
//  Main.swift
//  FinalApp
//
//  Created by Tallon Pelikan on 3/27/24.
//

import SwiftUI

struct Main: View {
    @Binding
    var gameIsShowing: Bool
    @Binding
    var DailyJournalIsShowing: Bool
    
    var body: some View {
        VStack{
            if(!gameIsShowing && !DailyJournalIsShowing){
                StockJournals()
            }else if(gameIsShowing){
                Game()
            }else {
                CalendarView()
            }
            HStack(spacing:40){
                Button(action: {
                    gameIsShowing = false;
                    DailyJournalIsShowing = false
                        }) {
                            Image(systemName: "applewatch")
                                .foregroundColor(.red) // Color of the icon
                                .font(.largeTitle) // Size of the icon
                        }
                Button(action: {
                    DailyJournalIsShowing = true;
                    gameIsShowing = false;
                        }) {
                            Image(systemName: "pencil.and.list.clipboard")
                                .foregroundColor(.red) // Color of the icon
                                .font(.largeTitle) // Size of the icon
                        }
                Button(action: {
                    gameIsShowing = true;
                    DailyJournalIsShowing = false
                        }) {
                            Image(systemName: "gamecontroller.fill")
                                .foregroundColor(.red) // Color of the icon
                                .font(.largeTitle) // Size of the icon
                        }
            }
        }
        
    }
}

//#Preview {
//    Main()
//}
