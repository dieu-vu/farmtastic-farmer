//
//  UpdateProfileView.swift
//  FarmtasticFarmer
//
//  Created by Nguyen Giang on 11.4.2022.
//

import SwiftUI

struct UpdateProfileView: View {
    @AppStorage("language")
    private var language = LocalizationService.shared.language
    @Binding var showUpdateProfile: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                FormView(formTitle: "profile.update".localized(language: language), fieldPlaceholder1: "New name", fieldPlaceholder2: "New address", fieldPlaceholder3: "New number")
                ButtonView(buttonText: "apply".localized(language: language), buttonColorLight: "LightGreen", buttonColorDark: "DarkGreen" , buttonAction: { showUpdateProfile.toggle() })
                    .padding(.bottom, 32)
            }
        }
    }
}

struct UpdateProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateProfileView(showUpdateProfile: .constant(false))
    }
}
