//
//  ProductModel.swift
//  FarmtasticFarmer
//
//  Created by Dieu Vu on 4/18/22.
//

import Foundation

class ProductModel: ObservableObject {
    
    @Published var products = [Product]()
    
    init () {
        // Check if we have loaded data into Coredata
        checkLoadedData()
    }
    
    
    func checkLoadedData() {
        // Check local storage
        let status = UserDefaults.standard.bool(forKey: Constants.isDataPreLoaded)
    
        // If no data preloaded, request and parse the user data and preload into Core Data
        if status == false {
            preLoadLocalData()
        }
    }
    
    func preLoadLocalData() {
        // Request and parse user data
      
        // Create CoreData object
        
        // Save into core data
        
        // Set local storage flag
    }
}
