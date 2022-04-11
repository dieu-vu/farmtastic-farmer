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
                    .cornerRadius(20.0)
                
                SecureField("Password", text: self.$password)
                    .padding()
                    .cornerRadius(20.0)
                    .shadow(radius: 10.0, x: 20, y: 10)
            }.padding([.leading, .trailing], 27.5)
            
            Button(action: {}) {
                Text("Log In")
                    .font(.headline)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.green)
                    .cornerRadius(15.0)
            }.padding(.top, 50)
                    
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
