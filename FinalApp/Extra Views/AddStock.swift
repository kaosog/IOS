//
//  AddStock.swift
//  FinalApp
//
//  Created by Tallon Pelikan on 3/27/24.
//

import SwiftUI
import FirebaseDatabase
import FirebaseAuth

struct AddStock: View {
    @State var ticker = "FaceBook"
    @State var note = "Great stock"
    @State var gains = 500.00
    var body: some View {
        TextField("ticker", text: $ticker)
        TextField("Notes...", text: $note)
        //TextField("gains", text: $gains)
        Button(action: {
            addStock()
        }) {
            Text("Tap me!") // Text displayed on the button
                .padding() // Add some padding around the text
                .background(Color.blue) // Background color of the button
                .foregroundColor(.white) // Text color of the button
                .cornerRadius(10) // Rounded corners for the button
        }
        
    }
    func addStock(){
        var ref = Database.database().reference()
        var UserID = Auth.auth().currentUser?.uid ?? ""
        var t = Stock(gains: gains, notes: note, ticker: ticker)
        ref.child(UserID).child("stockNotes").child(ticker).setValue(t.toDictionary)
    }

}

#Preview {
    AddStock()
}
