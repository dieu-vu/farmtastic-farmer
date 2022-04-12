//
//  LoginForm.swift
//  FarmtasticFarmer
//
//  Created by Dieu Vu on 4/3/22.
//

import SwiftUI

struct LoginForm: View {
    
    @StateObject private var loginController = LoginController()
    
    var body: some View {
        /* VStack {
            Form {
                HStack {
                    Spacer()
                    Text(loginController.isAuthenticated ? "authenticated" : "not authenticated")
                }
                TextField("Username", text: $loginController.username)
                    .autocapitalization(.none)
                TextField("Password", text: $loginController.password)
                    .autocapitalization(.none)
                HStack {
                    Spacer()
                    Button("Login") {
                        loginController.login()
                    }
                    Spacer()
                }
            }
            .buttonStyle(PlainButtonStyle())
        }*/
        
        VStack() {
            Text("Log In")
                .font(.largeTitle)
                .padding([.top, .bottom], 40)
            
            VStack(alignment: .leading, spacing: 15) {
                TextField("Username", text: $loginController.username)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                
                SecureField("Password", text: $loginController.password)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                    )
            }.padding([.leading, .trailing], 27.5)
            
            ButtonView(buttonText: "Login",
                       buttonColorLight: "LightGreen",
                       buttonColorDark: "DarkGreen",
                       buttonAction: {loginController.login()})
        }
    }
} 

struct LoginForm_Previews: PreviewProvider {
    static var previews: some View {
        LoginForm()
    }
}
