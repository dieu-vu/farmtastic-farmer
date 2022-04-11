//
//  UserProfile.swift
//  FarmtasticFarmer
//
//  Created by Dieu Vu on 4/10/22.
//

import Foundation

struct User: Codable {
    let user_id: Int
    var username: String
    var email: String
    struct UserExtraInfo: Codable {
        var name: String
        var type: String
        var address: String
        var phone: String
    }
    
    var full_name: UserExtraInfo
    
    
}


