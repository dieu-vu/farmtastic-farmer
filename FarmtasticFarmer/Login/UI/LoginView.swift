//
//  LoginView.swift
//  FarmtasticFarmer
//
//  Created by Trang on 8.4.2022.
//  UI for Login form

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var authentication: AuthenticationController
    @StateObject var userController = UserDataController()
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack() {
            Image("headerImage").resizable().frame(width: 450, height: 400).overlay(Rectangle().foregroundColor(.black).opacity(0.4)).offset(y: -20)
            
            RoundedRectangle(cornerRadius: 10).fill(.white).shadow(radius: 5).frame(height: 350).offset(y: -100).padding(.horizontal, 20).overlay(
                VStack {
                    Text(Translation().Login).font(.largeTitle)
                    VStack(alignment: .leading, spacing: 15) {
                        TextField(Translation().ProfileUsername, text: $username)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                            .autocapitalization(.none)
                        SecureField(Translation().ProfilePassword, text: $password)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                    }.padding([.leading, .trailing], 32)
                    ButtonView(buttonText: Translation().Login,
                               buttonColorLight: "LightGreen",
                               buttonColorDark: "DarkGreen",
                               buttonAction: {
                        authentication.login(username: username, password: password)
                    })
                    .disabled(username.isEmpty || password.isEmpty)

                }.offset(y: -80)
            ).padding(.bottom, -100)
            Image("logo").resizable().scaledToFit().frame(width: 300, height: 300).padding(.bottom, 50)
        }.edgesIgnoringSafeArea(.top)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .previewDevice("iPhone 13 Pro Max")
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}

