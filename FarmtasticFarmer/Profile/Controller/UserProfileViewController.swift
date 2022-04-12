//
//  UserProfileViewController.swift
//  FarmtasticFarmer
//
//  Created by Dieu Vu on 4/10/22.
//

import Foundation
import UIKit

// IN PROGRESS
// TODO: Implement this with ObservableObject

class UserProfileViewController {
    var currentUser: User
    init (){
        self.currentUser = User(user_id: 0, username: "init", email: "init", full_name: UserExtraInfo(name: "init", type:  "init", address: "init", phone:  "init"))
    }
    
}

extension UserProfileViewController {
    func fetchUser () {
        let userRequest = UserDataRequest()
        userRequest.getUser{ result in
        switch result {
            case .failure(let error):
                print(error)
            case .success(let user):
            self.currentUser = user
        }}
    }
}
