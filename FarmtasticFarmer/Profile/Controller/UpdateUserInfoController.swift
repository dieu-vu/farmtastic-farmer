//
//  UpdateUserInfoController.swift
//  FarmtasticFarmer
//
//  Created by hanghuynh on 13.4.2022.
//  Controller to handle data updated from update user info UI form and send data to webservice to make request

import Foundation

class UpdateUserInfoController: ObservableObject {
    
    func updateUserInfo(name: String, address: String, phone: String, type: Int = 0, location: [Int] = []) {
        
        WebService().updateUserInfo(name: name, address: address, phone: phone, type: type, location: location) { result in
            switch result {
            case .success(let message):
                print(message)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
