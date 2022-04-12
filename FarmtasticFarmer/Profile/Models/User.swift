//
//  UserProfile.swift
//  FarmtasticFarmer
//
//  Created by Dieu Vu on 4/10/22.
//

import Foundation

struct User: Decodable {
    let user_id: Int
    var username: String
    var email: String
    var full_name: UserExtraInfo
}


struct UserExtraInfo: Decodable {
    var name: String
    var type: String
    var address: String
    var phone: String
    var location: Array<Int>
}
