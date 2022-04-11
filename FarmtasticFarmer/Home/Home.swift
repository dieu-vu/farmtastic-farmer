//
//  Home.swift
//  FarmtasticFarmer
//
//  Created by Nguyen Giang on 7.4.2022.
//

import SwiftUI

struct Home: View {
    var body: some View {
        ZStack {
            Color("AppBackground")
                .ignoresSafeArea()
            Text("Home")
        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
