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
    var full_name: UserExtraInfo
    
    init (user_id: Int, username: String, email: String, full_name: UserExtraInfo) {
        self.user_id = user_id
        self.username = username
        self.email = email
        self.full_name = full_name
    }
}


struct UserExtraInfo: Codable {
    var name: String
    var type: Int
    var address: String
    var phone: String
    var location: Array<Int>?
}


extension User {
    static let initData: User =  User(user_id: 0, username: "init", email: "init", full_name: UserExtraInfo(name: "", type: 0, address: "init", phone:  "init", location:[]))
}


