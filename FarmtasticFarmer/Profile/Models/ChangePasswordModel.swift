//
//  ChangePasswordModel.swift
//  FarmtasticFarmer
//
//  Created by hanghuynh on 12.4.2022.
//

import Foundation
import SwiftUI

enum ChangePasswordError: Error {
    case custom(errorMessage: String)
}

struct ChangePasswordRequestBody: Codable {
    let password: String
}

class ChangePasswordModel {
    
    func changePassword(password: String, completion: @escaping (Result<String, ChangePasswordError>) -> Void) {
        
        guard let url = URL(string: "https://media.mw.metropolia.fi/wbma/users") else {
            completion(.failure(.custom(errorMessage: "URL is not correct")))
            return
        }
        
        guard let data = KeychainHelper.standard.read(service: "auth-token", account: "farmtastic") else {
            completion(.failure(.custom(errorMessage: "User is not authenticated")))
            return
        }
        
        let token = String(data: data, encoding: .utf8)!
        //print("Token for change password \(token)")
        let body = ChangePasswordRequestBody(password: password)
        var request = URLRequest(url: url)
        
        request.httpMethod = "PUT"
        request.addValue(token, forHTTPHeaderField: "x-access-token")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        //print("requestBody in ChangePasswordModel \(String(data: request.httpBody!, encoding: .utf8))")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Client error \(error)")
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Error in httpResponse")
                return
            }
            
            completion(.success("User profile updated"))
        }
        .resume()
    }
}
