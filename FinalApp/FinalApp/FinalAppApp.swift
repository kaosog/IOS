//
//  FinalAppApp.swift
//  FinalApp
//
//  Created by Tallon Pelikan on 3/4/24.
//

import SwiftUI
import Firebase

@main
struct FinalAppApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
