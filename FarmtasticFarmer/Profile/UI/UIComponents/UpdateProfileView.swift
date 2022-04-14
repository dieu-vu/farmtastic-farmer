//
//  UpdateProfileView.swift
//  FarmtasticFarmer
//
//  Created by Nguyen Giang on 11.4.2022.
//

import SwiftUI

struct UpdateProfileView: View {
    @Binding var showUpdateProfile: Bool
    @StateObject private var updateUserInfoController = UpdateUserInfoController()
    @State var isDisabled = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Update Profile").font(.title).bold()
                VStack(alignment: .leading, spacing: 15) {
                    TextField("Name", text: $updateUserInfoController.name)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .disabled(isDisabled)
                    TextField("Address", text: $updateUserInfoController.address)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .disabled(isDisabled)
                    TextField("Phone number", text: $updateUserInfoController.phone)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .disabled(isDisabled)
                }
                .padding([.leading, .trailing], 27.5)
                ButtonView(buttonText: "Apply", buttonColorLight: "LightGreen", buttonColorDark: "DarkGreen" , buttonAction: {
                    isDisabled = true
                    closeKeyboard()
                    updateUserInfoController.updateUserInfo()
                    showUpdateProfile.toggle()
                    
                })
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
