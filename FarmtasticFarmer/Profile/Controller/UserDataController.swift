//
//  UserProfileViewController.swift
//  FarmtasticFarmer
//
//  Created by Dieu Vu on 4/10/22.
//

import Foundation
import UIKit
import CoreData


class UserDataController: UIViewController, ObservableObject {
    
    
    @Published var currentUser = User.initData

    let context = PersistenceController.shared.container.viewContext
    

    func fetchUser (completion: @escaping(Result<User, Error>)-> Void) {
        print("FIRST CURRENT USER \(self.currentUser)")

        DispatchQueue.global(qos: .userInteractive).sync {
            do {
                let userRequest = WebService()
                userRequest.getUser { result in
                switch result {
                    case .failure(let error):
                        print("FAILURE \(error)")
                        completion(.failure(error))
                    case .success(let user):
                        DispatchQueue.main.sync {
                            self.currentUser = user
                            print(self.currentUser.full_name.phone)
//                            self.saveUser(context: self.context, user: user)
                        }
                }}
                completion(.success(self.currentUser))
            }
        }
        
    }
    
    func saveUser(context: NSManagedObjectContext, user: User){
        //save fetched User to core data
        let userFetched = UserFetched(context: context)
        userFetched.user_id = Int16(user.user_id)
        userFetched.username = user.username
        userFetched.email = user.email
        userFetched.phone = user.full_name.phone
        userFetched.address = user.full_name.address
        userFetched.name = user.full_name.name
        userFetched.location = user.full_name.location ?? []
        userFetched.type = user.full_name.type
        do {
            try context.save()
        } catch {
            UserDefaults.standard.setValue(true, forKey: Constants.isDataPreLoaded)
        }
    }
    
    
    
    

    
    
//    let userDefaults: UserDefaults
//    
//    enum Key: String, CaseIterable {
//        case name, full_name
//        func make(for userId: Int) -> String {
//            return self.rawValue + "_" + String(userId)
//        }
//    }
//    
//    init(userDefaults: UserDefaults = .standard){
//        self.userDefaults = userDefaults
//    }
//    
//    func storeUserInfo(forUserId userId: Int, full_name: UserExtraInfo) {
//        saveValue(forKey: .full_name, value: full_name, userId: userId)
//    }
//    
//    func getUserInfo(forUserId userId: Int) -> UserExtraInfo? {
//        let full_name: UserExtraInfo? = readValue(forKey: .full_name, userId: userId)
//        return full_name
//    }
//    
//    func removeUserInfo(forUserID userId: Int) {
//        Key
//            .allCases
//            .map { $0.make(for: userId) }
//            .forEach { key in
//                userDefaults.removeObject(forKey: key)
//        }
//    }
//    
//    private func saveValue(forKey key: Key, value: Any, userId: Int) {
//        userDefaults.set(value, forKey: key.make(for: userId))
//    }
//    
//    private func readValue<T>(forKey key: Key, userId: Int) -> T? {
//            return userDefaults.value(forKey: key.make(for: userId)) as? T
//        }
//    
}
