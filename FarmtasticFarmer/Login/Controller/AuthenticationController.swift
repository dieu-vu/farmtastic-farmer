//
//  AuthenticationController.swift
//  FarmtasticFarmer
//
//  Created by hanghuynh on 14.4.2022.
//

import Foundation

class AuthenticationController: ObservableObject {
    
    @Published var isLoggedIn: Bool = false
    let defaults = UserDefaults.standard
    
    func login(username: String, password: String) {
        
        WebService().login(username: username, password: password) { result in
            switch result {
            case .success:
                self.defaults.set(Date.timeIntervalSinceReferenceDate, forKey: "tokenCreatedDate")
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
