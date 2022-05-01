//
//  UserProfileViewController.swift
//  FarmtasticFarmer
//
//  Created by Dieu Vu on 4/10/22.
//  Controller to handle data between webservice and Profile UI, including loading user data from API and save to Core Data

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
                        self.clearUserCoreData(context: self.context)
                        DispatchQueue.main.sync {
                            self.currentUser = user
                            print("logged in user", user.username)
                            let string_test = String(data: try! JSONEncoder().encode(self.currentUser.full_name), encoding: .utf8)
                            print("convert extra info to string: \(type(of:string_test))")
                            // Save current user to CoreData UserFetched
                            self.saveUser(context: self.context, user: user)
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
        userFetched.type = Int16(user.full_name.type)
        do {
            try context.save()
        } catch {
            UserDefaults.standard.setValue(true, forKey: Constants.isDataPreLoaded)
        }
    }
    
    
    func clearUserCoreData(context: NSManagedObjectContext) {
        let fetchRequest: NSFetchRequest<UserFetched> = UserFetched.fetchRequest()
        let items = try! context.fetch(fetchRequest)
        for item in items {
            context.delete(item)
        }
        do {
            try context.save()
        } catch {
            print("CANNOT CLEAR USER DATA TABLE")
        }
    }
    
    func getCurrentUserDataFromCD(){
        
    }
}
