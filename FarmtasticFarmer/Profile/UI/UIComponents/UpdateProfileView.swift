//
//  UpdateProfileView.swift
//  FarmtasticFarmer
//
//  Created by Nguyen Giang on 11.4.2022.
//

import SwiftUI

struct UpdateProfileView: View {
    @Binding var showUpdateProfile: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                FormView(formTitle: "Update Profile", fieldPlaceholder1: "New name", fieldPlaceholder2: "New address", fieldPlaceholder3: "New number")
                ButtonView(buttonText: "Apply", buttonColorLight: "LightGreen", buttonColorDark: "DarkGreen" , buttonAction: { showUpdateProfile.toggle() })
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
