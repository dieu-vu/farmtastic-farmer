//
//  ChangePasswordView.swift
//  FarmtasticFarmer
//
//  Created by Nguyen Giang on 11.4.2022.
//

import SwiftUI

struct ChangePasswordView: View {
    @AppStorage("language")
    private var language = LocalizationService.shared.language
    @Binding var showChangePassword: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                FormView(formTitle: "profile.changePassword".localized(language: language), fieldPlaceholder1: "profile.oldPassword".localized(language: language), fieldPlaceholder2: "profile.newPassword".localized(language: language), fieldPlaceholder3: "profile.confirmPassword".localized(language: language))
                ButtonView(buttonText: "apply".localized(language: language), buttonColorLight: "LightGreen", buttonColorDark: "DarkGreen" , buttonAction: { showChangePassword.toggle() })
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
