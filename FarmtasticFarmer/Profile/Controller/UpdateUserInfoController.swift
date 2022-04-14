//
//  UpdateUserInfoController.swift
//  FarmtasticFarmer
//
//  Created by hanghuynh on 13.4.2022.
//

import Foundation

class UpdateUserInfoController: ObservableObject {
    
    @Published var name: String = ""
    @Published var address: String = ""
    @Published var phone: String = ""
    
    func updateUserInfo() {
        
        WebService().updateUserInfo(name: name, address: address, phone: phone) { result in
            switch result {
            case .success(let message):
                print(message)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
