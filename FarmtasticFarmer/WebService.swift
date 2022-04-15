//
//  WebService.swift
//  FarmtasticFarmer
//
//  Created by hanghuynh on 13.4.2022.
//

import Foundation
import SwiftUI

enum CustomError: Error {
    case invalidCredentials
    case invalidToken
    case cannotProcessData
    case custom(errorMessage: String)
}

struct UpdateUserInfo: Codable {
    var full_name:  UpdatedFields
}

struct UpdatedFields: Codable {
    let name: String
    let address: String
    let phone: String
}

struct ChangePasswordRequestBody: Codable {
    let password: String
}

struct LoginRequestBody: Codable {
    let username: String
    let password: String
}

struct LoginResponse: Codable {
    let token: String?
    let message: String?
}

class WebService {
    
    let baseUrl = "https://media.mw.metropolia.fi/wbma/"
    
    func login(username: String, password: String, completion: @escaping (Result<Bool, CustomError>) -> Void) {
        
        guard let url = URL(string: "\(baseUrl)login") else {
            completion(.failure(.custom(errorMessage: "URL is not correct")))
            return
        }
        
        let body = LoginRequestBody(username: username, password: password)
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let data = data, error == nil else {
                completion(.failure(.custom(errorMessage: "No data")))
                return
            }
            
            guard let loginResponse = try? JSONDecoder().decode(LoginResponse.self, from: data) else {
                completion(.failure(.invalidCredentials))
                return
            }
            
            guard let token = loginResponse.token else {
                completion(.failure(.invalidCredentials))
                return
            }
            
            let savedToken = Data(token.utf8)
            
            KeychainHelper.standard.save(savedToken, service: "auth-token", account: "farmtastic")
            DispatchQueue.main.async {
                completion(.success(true))
            }
        }
        .resume()
    }
    
    func getUserToken() -> String? {
        
        guard let data = KeychainHelper.standard.read(service: "auth-token", account: "farmtastic") else {
            fatalError("getUserToken: Token not found")
        }
        
        return String(data: data, encoding: .utf8)
    }
    
    func getUser(completion: @escaping (Result<User, CustomError>) -> Void) {
        
        guard let url = URL(string: "\(baseUrl)users/user") else {
            fatalError("getUserInfo: Failed to create URL")
        }
        
        guard let token = getUserToken() else {
            fatalError("getUserInfo: Token not found")
        }
        print("token \(token)")
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        request.addValue(token, forHTTPHeaderField: "x-access-token")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let dataTask = URLSession.shared.dataTask(with: request){data, response, error in
            if let error = error {
                print("dataTask error: \(error.localizedDescription)")
            }
            else {
                guard let response = response else {
                    return
                }
                print("response: \(response.expectedContentLength)")
                if let data = data {
                    do {
                        let reformattedData = Utils.utils.preProcessJson(data)
                        let decoder = JSONDecoder()
                        let user = try decoder.decode(User.self, from: reformattedData)
                        completion(.success(user))
                    } catch {
                        print("failed to load")
                        completion(.failure(.cannotProcessData))
                    }
                }
            }
        }
        dataTask.resume()
    }
    
    func updateUserInfo(name: String, address: String, phone: String, completion: @escaping (Result<String, CustomError>) -> Void) {
        
        guard let url = URL(string: "\(baseUrl)users") else {
            fatalError("getUserInfo: Failed to create URL")
        }
        
        guard let token = getUserToken() else {
            fatalError("getUserInfo: Token not found")
        }
        
        var request = URLRequest(url: url)
        let body = UpdateUserInfo(full_name: UpdatedFields(name: name, address: address, phone: phone))
        
        request.httpMethod = "PUT"
        request.addValue(token, forHTTPHeaderField: "x-access-token")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        //print("requestBody in UpdateUserInfo \(String(data: request.httpBody!, encoding: .utf8))")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                print("updateUserInfo: Client error \(error)")
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("updateUserInfo: Error in httpResponse")
                return
            }
            
            completion(.success("User info updated successfully"))
            
        }
        .resume()
    }
    
    func changePassword(password: String, completion: @escaping (Result<String, CustomError>) -> Void) {
        
        guard let url = URL(string: "\(baseUrl)users") else {
            completion(.failure(.custom(errorMessage: "changePassword: URL is not correct")))
            return
        }
        
        guard let token = getUserToken() else {
            return
        }
        print("Token for change password \(token)")
        let body = ChangePasswordRequestBody(password: password)
        var request = URLRequest(url: url)
        
        request.httpMethod = "PUT"
        request.addValue(token, forHTTPHeaderField: "x-access-token")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        print("requestBody in ChangePasswordModel \(String(describing: String(data: request.httpBody!, encoding: .utf8)))")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("changePassword: Client error \(error)")
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("changePassword: Error in httpResponse")
                return
            }
            
            completion(.success("Password changed successfully"))
        }
        .resume()
    }
    
    func logout(completion: @escaping (Result<Bool, CustomError>) -> Void) {
        KeychainHelper.standard.delete(service: "auth-token", account: "farmtastic")
        
        if KeychainHelper.standard.read(service: "auth-token", account: "farmtastic") != nil {
            completion(.failure(.custom(errorMessage: "Fail to delete token")))
            return
        }
        print("Logging out")
        completion(.success(true))
    }
    
    
}

