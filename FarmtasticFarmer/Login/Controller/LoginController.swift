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
    @Published var isAuthenticated: Bool = false
    
    func login() {
        
        WebService().login(username: username, password: password) { result in
            switch result {
            case .success(let token):
                let data = Data(token.utf8)
                KeychainHelper.standard.save(data, service: "auth-token", account: "farmtastic")
                // print("Saving token to keychain \(String(data: data, encoding: .utf8))")
                DispatchQueue.main.async {
                    self.isAuthenticated = true
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
