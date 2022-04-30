//
//  UpdateProfileView.swift
//  FarmtasticFarmer
//
//  Created by Nguyen Giang on 11.4.2022.
//  UI component for the Update profile form

import SwiftUI

struct UpdateProfileView: View {
    @Binding var showUpdateProfile: Bool
    @StateObject private var updateUserInfoController = UpdateUserInfoController()
    @State var isDisabled = false
    
    @EnvironmentObject var userController: UserDataController
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: []) private var loggedInUser: FetchedResults<UserFetched>
    
    @State var newName = ""
    @State var newAddress = ""
    @State var newNumber = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Text(Translation().ProfileUpdate).font(.title).bold()
                VStack(alignment: .leading, spacing: 15) {
                    TextField(Translation().ProfileNewName, text: $newName)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .disabled(isDisabled)
                    TextField(Translation().ProfileNewAddress, text: $newAddress)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .disabled(isDisabled)
                    TextField(Translation().ProfileNewPhone, text: $newNumber)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .disabled(isDisabled)
                }
                .padding([.leading, .trailing], 27.5)
                ButtonView(buttonText: Translation().Apply, buttonColorLight: "LightGreen", buttonColorDark: "DarkGreen" , buttonAction: {
                    isDisabled = true
                    closeKeyboard()
                    showUpdateProfile.toggle()

                    let checkedUpdatedUser = checkNewUserData(newName: newName, newNumber: newNumber, newAddress: newAddress)

                    updateUserInfoController.updateUserInfo(name: checkedUpdatedUser.name, address: checkedUpdatedUser.address, phone: String(checkedUpdatedUser.phone))

                })
                .padding(.bottom, 32)
            }
        }
    }
    
    
    // Helper function to check and refill existing data if any field is left blank
    func checkNewUserData(newName: String, newNumber: String, newAddress: String) -> UserExtraInfo {
        let loggedInUser = userController.currentUser.full_name
            if newAddress == "" {
                self.newAddress = loggedInUser.address
            }
            if newNumber == "" {
                self.newNumber = loggedInUser.phone
            }
            if newName == "" {
                self.newName = loggedInUser.name
            }
        
        return UserExtraInfo(name: self.newName, type: 0, address: self.newAddress, phone: self.newNumber)
    }
}

struct UpdateProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateProfileView(showUpdateProfile: .constant(false))
    }
}
