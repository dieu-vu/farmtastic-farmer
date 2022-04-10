//
//  ActionButton.swift
//  FarmtasticFarmer
//
//  Created by Nguyen Giang on 10.4.2022.
//

import SwiftUI

struct ActionButton: View {
    var icon: String = "clock"
    var title: String = "Order list"
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
        }).padding(.horizontal, 20).padding(.vertical, 10)
    }
}

struct ActionButton_Previews: PreviewProvider {
    static var previews: some View {
        ActionButton(icon: "clock", title: "Order list", onClick: {})
    }
}
