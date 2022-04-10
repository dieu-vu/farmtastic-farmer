//
//  Profile.swift
//  FarmtasticFarmer
//
//  Created by Nguyen Giang on 7.4.2022.
//

import SwiftUI

struct ProfileScreen: View {
    var body: some View {
        VStack {
            Color("AppBackground")
                .ignoresSafeArea()
            HeaderImage()
            Text("AFdsf")
            actionButtonGroup
            ButtonView(buttonText: "Log out", buttonAction: {})
        }
    }
    
    var actionButtonGroup: some View {
        VStack {
            ActionButton(icon: "clock", title: "Order list", onClick: {})
            ActionButton(icon: "t.bubble", title: "Change language", onClick: {})
            ActionButton(icon: "pencil", title: "Update profile", onClick: {})
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}
