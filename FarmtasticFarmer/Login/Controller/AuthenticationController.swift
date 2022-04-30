//
//  AuthenticationController.swift
//  FarmtasticFarmer
//
//  Created by hanghuynh on 14.4.2022.
//  Controller to handle data from actions on login form

import Foundation

class AuthenticationController: ObservableObject {
    
    @Published var isLoggedIn: Bool = false
    
    func login(username: String, password: String) {
        
        WebService().login(username: username, password: password) { result in
            switch result {
            case .success:
                self.isLoggedIn = true
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func logout() {
        
        WebService().logout() { result in
            switch result {
            case .success:
                self.isLoggedIn = false
                //completion(true)
            case .failure(let error):
                print(error.localizedDescription)
                //completion(false)
            }
        }
    }
}
