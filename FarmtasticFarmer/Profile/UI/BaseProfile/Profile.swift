//
//  Profile.swift
//  FarmtasticFarmer
//
//  Created by Nguyen Giang on 7.4.2022.
//

import SwiftUI

struct ProfileScreen: View {
    var body: some View {
        ZStack {
            Color("AppBackground")
                .ignoresSafeArea()
            Text("Profile")
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}
