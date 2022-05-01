//
//  ActionButton.swift
//  FarmtasticFarmer
//
//  Created by Nguyen Giang on 10.4.2022.
//  UI component for the action button on profile view, such as update profile or change language, etc.

import SwiftUI

struct ActionButton: View {
    var icon: String = ""
    var title: String = ""
    var onClick: () -> ()
    
    var body: some View {
        Button(action: {onClick()}, label: {
            HStack {
                Image(systemName: "\(icon)")
                Text("\(title)").foregroundColor(Color("DarkGreen")).fontWeight(.medium)
                Spacer()
                Image(systemName: "chevron.right")
            }.padding().overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color("DarkGreen"), lineWidth: 1)
            )
        })
        .padding(.horizontal, 32)
        .padding(.vertical, 10)
    }
}

struct ActionButton_Previews: PreviewProvider {
    static var previews: some View {
        ActionButton(icon: "clock", title: "Order list", onClick: {})
    }
}
