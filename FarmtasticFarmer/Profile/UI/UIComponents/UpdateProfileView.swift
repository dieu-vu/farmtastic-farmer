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
    @StateObject private var updateUserInfoController = UpdateUserInfoController()
    @State var isDisabled = false
    
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: []) private var loggedInUser: FetchedResults<UserFetched>
    
    @State var newName = ""
    @State var newAddress = ""
    @State var newNumber = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Text("User in coredata \(loggedInUser.count)")
                Text("profile.update".localized(language: language)).font(.title).bold()
                VStack(alignment: .leading, spacing: 15) {
                    TextField("profile.newName".localized(language: language), text: $newName)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .disabled(isDisabled)
                    TextField("profile.newAddress".localized(language: language), text: $newAddress)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .disabled(isDisabled)
                    TextField("profile.newPhone".localized(language: language), text: $newNumber)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .disabled(isDisabled)
                }
                .padding([.leading, .trailing], 27.5)
                ButtonView(buttonText: "apply".localized(language: language), buttonColorLight: "LightGreen", buttonColorDark: "DarkGreen" , buttonAction: {
                    isDisabled = true
                    closeKeyboard()
                    checkNewUserData(newName: newName, newNumber: newNumber, newAddress: newAddress, loggedInUser: loggedInUser.last)
                    updateUserInfoController.updateUserInfo(name: newName, address: newAddress, phone: newNumber)
                    // Verify if update fields are left blank, if blank then filled from CoreData
                    //let temp = checkNewUserData(newData: updateUserInfoController, loggedInUser: loggedInUser.last)
                    /*updateUserInfoController.address = temp.address
                    updateUserInfoController.name = temp.name
                    updateUserInfoController.phone = temp.phone
                    updateUserInfoController.location = [Int](loggedInUser.last?.location ?? [])
                    updateUserInfoController.updateUserInfo()*/
                    showUpdateProfile.toggle()
                    
                })
                .padding(.bottom, 32)
            }
        }
    }
    
    func checkNewUserData(newName: String, newNumber: String, newAddress: String, loggedInUser: UserFetched?) {
        //let checkedNewData = UpdateUserInfoController()
        if newAddress == "" {
            self.newName = loggedInUser?.address ?? ""
        }
        if newNumber == "" {
            self.newNumber = loggedInUser?.phone ?? ""
        }
        if newName == "" {
            self.newName = loggedInUser?.name ?? ""
        }
    }
}

struct UpdateProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateProfileView(showUpdateProfile: .constant(false))
    }
}
