//
//  UserDataAPI.swift
//  FarmtasticFarmer
//
//  Created by Dieu Vu on 4/10/22.
//

import Foundation
import SwiftUI
import CoreData

enum UserRequestError: Error {
    case invalidToken
    case cannotProcessData
}

struct UserDataRequest{
    let sourceUrl: URL
    
    //hardcoded, TODO: study storing token in app
    let token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoyNiwidXNlcm5hbWUiOiJkaWV1diIsImVtYWlsIjoiZGlldXZAbWV0cm9wb2xpYS5maSIsImZ1bGxfbmFtZSI6IntcInN1YnNjcmliZWRfbWVkaWFcIjpbMTM1OSwxNzA5LDE3MzUsMTM1NSwxOTIzLDI1NDcsMjU2N119IiwiaXNfYWRtaW4iOm51bGwsInRpbWVfY3JlYXRlZCI6IjIwMjItMDEtMTBUMTM6Mzk6MjAuMDAwWiIsImlhdCI6MTY0OTU3NjkyNSwiZXhwIjoxNjQ5NjYzMzI1fQ.BE9QlHDQ6d_nSPQl3Bic-G9-XKrK4a5jWiWzwjnPSDg"
    
    init (){
        let sourceString = "https://media.mw.metropolia.fi/wbma/users/user"
        guard let sourceURL = URL(string: sourceString) else {fatalError()}
        
        self.sourceUrl = sourceURL
    }
    
    
    //tut: https://www.youtube.com/watch?v=tdxKIPpPDAI
    func getUser (completion: @escaping(Result<User, UserRequestError>)->Void){
        let dataTask = URLSession.shared.dataTask(with: sourceUrl){ data,_,_ in
            guard let jsonData = data else {
                completion(.failure(.invalidToken))
                return
            }
            do {
                let decoder = JSONDecoder()
                // make sure this JSON is in the format we expect
                let user = try decoder.decode(User.self, from: jsonData)
                let userDetails = user.full_name
                completion(.success(user))
                // try to read out a string array
                print(user)
                print(userDetails)
                print(user.full_name.address)
            } catch {
                completion(.failure(.cannotProcessData))
            }
        
        }
        dataTask.resume()
        
    }
    
}
