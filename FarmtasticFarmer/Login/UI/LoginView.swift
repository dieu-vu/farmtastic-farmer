//
//  LoginView.swift
//  FarmtasticFarmer
//
//  Created by Trang on 8.4.2022.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var loginController = LoginController()
    @EnvironmentObject var authentication: Authentication
    
    var body: some View {
        
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
                    .autocapitalization(.none)
                SecureField("Password", text: $loginController.password)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .autocapitalization(.none)
            }.padding([.leading, .trailing], 27.5)
            ButtonView(buttonText: "Login",
                       buttonColorLight: "LightGreen",
                       buttonColorDark: "DarkGreen",
                       buttonAction: {
                loginController.login { success in
                    authentication.updatedAuthentication(success: success)
                }
            })
            
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
