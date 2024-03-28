//
//  Login.swift
//  FinalApp
//
//  Created by Tallon Pelikan on 3/4/24.
//

import SwiftUI
import Charts

class Accounts{
    @State var username: String = ""
    @State var password: String = ""

    func log(){
        
    }
    func sign(){
        
    }
}

struct Login: View {
    @State var information = Accounts()
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
                    TextField("USERNAME", text: information.$username)
                        .padding(.leading,UIScreen.main.bounds.width/2.5)
                    SecureField("PASSWORD", text: information.$password)
                        .padding(.leading,UIScreen.main.bounds.width/2.5)
                }
            }
                    Spacer()
                    HStack{
                        Button("Log In"){
                            information.log()
                            loginIsShowing = false;
                        }
                        .frame(width:125,height:50)
                        .background(Color.white)
                        .cornerRadius(100)
                        
                        Button("Sign Up"){
                            information.sign()
                        }
                        .frame(width:125,height:50)
                        .background(Color.white)
                        .cornerRadius(100)
                    }
                    Spacer()
                }
                .background(Color.cyan)
            }
        }
    


//#Preview {
//    Login(loginIsShowing: true)
//}
