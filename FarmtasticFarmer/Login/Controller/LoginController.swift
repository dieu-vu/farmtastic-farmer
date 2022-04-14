//
//  LoginController.swift
//  FarmtasticFarmer
//
//  Created by hanghuynh on 12.4.2022.
//

import Foundation

class LoginController: ObservableObject {
    
    @Published var username: String = ""
    @Published var password: String = ""
    
    func login(completion: @escaping (Bool) -> Void) {
        
        WebService().login(username: username, password: password) { result in
            switch result {
            case .success:
                completion(true)
            case .failure(let error):
                print(error.localizedDescription)
                completion(false)
            }
        }
    }
}
