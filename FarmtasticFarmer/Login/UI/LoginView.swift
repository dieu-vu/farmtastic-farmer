//
//  LoginView.swift
//  FarmtasticFarmer
//
//  Created by Trang on 8.4.2022.
//

import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        VStack() {
            Text("Log In")
                .font(.largeTitle)
                .padding([.top, .bottom], 40)
            
            VStack(alignment: .leading, spacing: 15) {
                TextField("Username", text: self.$username)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                        )
                
                SecureField("Password", text: self.$password)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                        )
            }.padding([.leading, .trailing], 27.5)
            
            ButtonView(buttonText: "Login",
                       buttonColorLight: "LightGreen",
                       buttonColorDark: "DarkGreen",
                       buttonAction: {print("Button clicked")})
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
