//
//  ContentView.swift
//  FarmtasticFarmer
//
//  Created by hanghuynh on 12.4.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var isAuthenticated = AppManager.isAuthenticated()
    
    var body: some View {
        Group {
            isAuthenticated ? AnyView(BaseView()) : AnyView(LoginView())
        }
        .onReceive(AppManager.Authenticated, perform: { isAuthenticated = $0 })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
