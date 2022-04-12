//
//  ChangePasswordView.swift
//  FarmtasticFarmer
//
//  Created by Nguyen Giang on 11.4.2022.
//

import SwiftUI

struct ChangePasswordView: View {
    @Binding var showChangePassword: Bool
    @StateObject private var changePasswordControler = ChangePasswordController()
    @State var isDisabled = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Change Password").font(.title).bold()
                VStack(alignment: .leading, spacing: 15) {
                    TextField("New password", text: $changePasswordControler.password)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        //.disabled(isDisabled)
                    TextField("Confirmed password", text: $changePasswordControler.confirmedPassword)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        //.disabled(isDisabled)
                }
                .padding([.leading, .trailing], 27.5)
                ButtonView(buttonText: "Apply", buttonColorLight: "LightGreen", buttonColorDark: "DarkGreen" , buttonAction: {
                    //closeKeyboard()
                    //isDisabled = true
                    changePasswordControler.changePassword()
                    showChangePassword.toggle()
                })
                    .padding(.bottom, 32)
            }
        }
    }
}

/*func closeKeyboard() {
    UIApplication.shared.sendAction(
        #selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil
    )
}*/

struct ChangePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ChangePasswordView(showChangePassword: .constant(false))
    }
}
