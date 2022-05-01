//
//  ButtonView.swift
//  FarmtasticFarmer
//
//  Created by hanghuynh on 7.4.2022.
//

import SwiftUI

// Reusable components for all buttons in the app

struct ButtonView: View {
    var buttonText: String
    var buttonColorLight: String
    var buttonColorDark: String
    var buttonAction: () -> ()
    
    var body: some View {
        Button(action: {buttonAction()}) {
            Text("\(buttonText)")
                .bold()
                .foregroundColor(Color.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Capsule().fill(LinearGradient(gradient: Gradient(colors: [Color("\(buttonColorLight)"), Color("\(buttonColorDark)")]), startPoint: .leading, endPoint: .trailing)))
        }
        .padding(32)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(buttonText: "Delete", buttonColorLight: "PinkishRed", buttonColorDark: "PinkishRed", buttonAction: {print("Button clicked")})
            .previewLayout(.sizeThatFits)
        ButtonView(buttonText: "Apply", buttonColorLight: "LightGreen", buttonColorDark: "DarkGreen", buttonAction: {print("Button clicked")})
            .previewLayout(.sizeThatFits)
    }
}
