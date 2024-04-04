//
//  Login.swift
//  FinalApp
//
//  Created by Tallon Pelikan on 3/4/24.
//

import SwiftUI
import Charts
import FirebaseAuth
import FirebaseDatabase



struct Login: View {
    @State private var email = ""
    @State private var password = ""
    @State private var userIsLoggedIn = false
    
    @Binding var UserID: String
    @Binding var loginIsShowing: Bool
    var body: some View {
        VStack{
            StocksImage()
                .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height/3)
                .background(.black)
            ZStack{
                Rectangle()
                    .foregroundColor(Color.white)
                    .zIndex(0)
                    .frame(width: UIScreen.main.bounds.width/1.25,height: UIScreen.main.bounds.height/3)
                    .opacity(0.5)
                    .cornerRadius(20.0)
                    .shadow(radius: 150)
                VStack{
                    Text("Stock Assistant")
                        .font(.title)
                        .background(Color.white)
                    TextField("USERNAME", text: $email)
                        .padding(.leading,UIScreen.main.bounds.width/2.5)
                    SecureField("PASSWORD", text: $password)
                        .padding(.leading,UIScreen.main.bounds.width/2.5)
                }
            }
                    Spacer()
                    HStack{
                        Button("Log In"){
                            login()
                            loginIsShowing = false;
                        }
                        .frame(width:125,height:50)
                        .background(Color.white)
                        .cornerRadius(100)
                        
                        Button("Sign Up"){
                            register()
                        }
                        .frame(width:125,height:50)
                        .background(Color.white)
                        .cornerRadius(100)
                    }
                    Spacer()
                }
                .background(Color.cyan)
                .onAppear{
                    Auth.auth().addStateDidChangeListener { auth, user in
                        if user != nil{
                            
                            //loginIsShowing.toggle()
                        }
                    }
                }
            }
    func checkLoggedIn(){
        if userIsLoggedIn{
            loginIsShowing = false
        }
    }
    func login(){
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil{
                print(error!.localizedDescription)
            }
        }
    }
    func register(){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil{
                print(error!.localizedDescription)
            }
        }
        storeUser()
    }
    
    func storeUser(){
        var test = [DailyNotes(days: String("12/9/2024"), notes: String("My first day of journaling"))]
        var test2 = [Stock(gains: 100.22, notes: String("I tried very hard"), ticker: "Tesla")]
        var ref = Database.database().reference()
        UserID = Auth.auth().currentUser?.uid ?? ""
        var user = User(UID: UserID, dailyNotes: test, stockNotes: test2)
        ref.child(user.UID).setValue(user.toDictionary)
        ref.parent?.key
    }
    
        }
    


//#Preview {
//    Login(loginIsShowing: true)
//}
