//
//  ChangePasswordView.swift
//  FarmtasticFarmer
//
//  Created by Nguyen Giang on 11.4.2022.
//

import SwiftUI

struct ChangePasswordView: View {
    @Binding var showChangePassword: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                FormView(formTitle: "Change password", fieldPlaceholder1: "Old password", fieldPlaceholder2: "New password", fieldPlaceholder3: "Confirm new password")
                ButtonView(buttonText: "Apply", buttonColorLight: "LightGreen", buttonColorDark: "DarkGreen" , buttonAction: { showChangePassword.toggle() })
                    .padding(.bottom, 32)
            }
        }
    }
}

struct ChangePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ChangePasswordView(showChangePassword: .constant(false))
    }
}
