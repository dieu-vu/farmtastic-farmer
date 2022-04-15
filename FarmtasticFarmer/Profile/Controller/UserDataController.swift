//
//  UserProfileViewController.swift
//  FarmtasticFarmer
//
//  Created by Dieu Vu on 4/10/22.
//

import Foundation
import UIKit


class UserDataController: ObservableObject {
    @Published var currentUser = User.initData
       
    func fetchUser (completion: @escaping(Result<User,Error>)-> Void) {
        print("FIRST CURRENT USER \(self.currentUser)")

        DispatchQueue.global(qos: .userInteractive).sync {
            do {
                let userRequest = WebService()
                userRequest.getUser { result in
                switch result {
                    case .failure(let error):
                        completion(.failure(error))
                    case .success(let user):
//                        print("loaded user \(user)")
                        DispatchQueue.main.sync {
                            self.currentUser = user
//                            print("CURRENT USER \(self.currentUser)")
                        }
                }}
                completion(.success(self.currentUser))
                }
        }

    }
}
