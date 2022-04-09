//
//  ButtonView.swift
//  FarmtasticFarmer
//
//  Created by hanghuynh on 7.4.2022.
//

import SwiftUI

struct ButtonView: View {
    var buttonText: String
    var buttonAction: () -> ()
    
    var body: some View {
        Button(action: {buttonAction()}) {
            Text("\(buttonText)")
                .bold()
                .foregroundColor(Color.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Capsule().fill(LinearGradient(gradient: Gradient(colors: [Color("LightGreen"), Color("DarkGreen")]), startPoint: .leading, endPoint: .trailing)))
        }
        .padding(32)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(buttonText: "Apply", buttonAction: {print("Button clicked")})
    }
}
