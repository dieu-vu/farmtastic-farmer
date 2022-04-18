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
    
    //Data for UserFetched table
    var loggedInUser: [UserFetched]?
    
//    func fetchUserFromCoreData() {
//        do {
//            let fr: NSFetchRequest<UserFetched> = UserFetched.fetchRequest()
//            self.loggedInUser = try context.fetch(fr)
//            DispatchQueue.main.async {
//                self.profileView.reloadData()
//            }
//        } catch {
//
//        }
//    }

    
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
//                        print("loaded user \(user)")
                        DispatchQueue.main.sync {
                            self.currentUser = user
//                            self.storeUserInfo(forUserId: user.user_id, full_name: user.full_name)
//                            print("CURRENT USER \(self.currentUser)")
                            self.save(context: self.context)
                        }
                }}
                completion(.success(self.currentUser))
            }
        }
        
    }
    
    func save(context: NSManagedObjectContext){
        //save fetched User to core data
        
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
