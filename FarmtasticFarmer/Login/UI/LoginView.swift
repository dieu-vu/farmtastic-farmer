//
//  LoginView.swift
//  FarmtasticFarmer
//
//  Created by Trang on 8.4.2022.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var authentication: AuthenticationController
    @StateObject var userController = UserDataController()
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        ScrollView() {
        
            Image("headerImage").overlay(Rectangle().foregroundColor(.black).opacity(0.4)).offset(y: -20)
        
        
            Text("Log In")
                .font(.largeTitle)
            
            VStack(alignment: .leading, spacing: 15) {

                TextField("Username", text: $username)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .autocapitalization(.none)
                SecureField("Password", text: $password)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                        )
            }.padding([.leading, .trailing], 27.5)
            
            ButtonView(buttonText: "Login",
                       buttonColorLight: "LightGreen",
                       buttonColorDark: "DarkGreen",
                       buttonAction: {
                authentication.login(username: username, password: password)
                })
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
