//
//  ChangePasswordController.swift
//  FarmtasticFarmer
//
//  Created by hanghuynh on 12.4.2022.
//  Controller to handle request for actions on change password form

import Foundation

class ChangePasswordController: ObservableObject {
    
    @Published var password: String = ""
    @Published var confirmedPassword: String = ""
    
    func changePassword() {
        
        if password == confirmedPassword {
            WebService().changePassword(password: password) { result in
                switch result {
                case .success(let message):
                    print(message)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        } else {
            password = ""
            confirmedPassword = ""
        }
    }
}
