//
//  StockJournals.swift
//  FinalApp
//
//  Created by Tallon Pelikan on 3/27/24.
//

import SwiftUI
import FirebaseDatabase
import FirebaseAuth

struct StockJournals: View {
    //@State
    //var test: User = User()
    @Binding var UserID: String
    @State
    var Stocks: [Stock] = [Stock]()
    var body: some View {
        NavigationView{
            List(Stocks){ stock in
                
                
                //WILL NEED TO CHANGE BACK!!!!!
                
                
                NavigationLink(destination: Game()){
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
            .onAppear{
                fetchData{ temp in
                    //test = temp
                    //Stocks = test.stockNotes
                }
            }
        }
       
        .listStyle(PlainListStyle())
        .onAppear{
            fetchData{ temp in
                //test = temp
                //Stocks = test.stockNotes
            }
        }
    }
    
    }

//func fetchData(completion: @escaping ([Stock]) -> Void){
//    var ref = Database.database().reference()
//    var user = Auth.auth().currentUser?.uid ?? ""
//    var stocks:[Stock] = []
//    var zeet = ref.child("jpnpf4FoFEZW6W2hktXh4fBWGz93").child("dailyNotes").observe(.childAdded, with: { snapshot in
//        guard let stockData = snapshot.value as? [String: Any]
//        else {
//            print("Failed to parse item data for key: \(snapshot.key)")
//            return
//        }
//        print("\(snapshot.children) Hello")
//        snapshot
//        
//                  //let new = Stock(gains: gains, notes: notes, ticker: ticker)
//        //stocks.append(new)
//        completion(stocks)
//    })
//}
//func fetchDays(refP: String,completion: @escaping ([Date])-> Void){
//    var ref = Database.database().reference()
//    ref = ref.child(refP).child("")
//}
//func fetchData(completion: @escaping ([Stock]) -> Void){
//    var user = Auth.auth().currentUser?.uid ?? ""
//    var ref = Database.database().reference().child("jpnpf4FoFEZW6W2hktXh4fBWGz93")
//    var stocks:[Stock] = []
//    print("\(user) Hellooooo from africa")
//    ref.observe(.childAdded, with: { snapshot in
//        guard let stockData = snapshot.value as? [String: Any],
//              let gains = stockData["gains"] as? Double,
//              //let notes = stockData["notes"] as? [NotesDaily],
//              let ticker = stockData["ticker"] as? String else {
//            print("Failed to parse item data for key: \(snapshot.key)")
//            return
//        }
//        print("\(gains) HELLLOOOO")
//                  //let new = Stock(gains: gains, notes: notes, ticker: ticker)
//        //stocks.append(new)
//        completion(stocks)
//    })
//}
func fetchData(completion: @escaping (User) -> Void){
    var ref = Database.database().reference()
    var user = Auth.auth().currentUser?.uid ?? ""
    var stocks:[User] = []
    ref.child("jpnpf4FoFEZW6W2hktXh4fBWGz93").child("stockNotes").observe(.childAdded, with: { snapshot in
        guard let stockData = snapshot.value as? [String: Any],
              let gains = stockData["dailyNotes"] as? [DailyNotes],
              let notes = stockData["StockNotes"] as? [Stock] else {
            print("Failed to parse item data for key: \(snapshot.key)")
            return
        }
        print("HELLLOO")
                  let new = User(UID: "BADDDDBG", dailyNotes: gains, stockNotes: notes)
        stocks.append(new)
        completion(new)
    })
}


//#Preview {
//    StockJournals()
//}
