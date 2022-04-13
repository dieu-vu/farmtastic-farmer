//
//  FarmtasticFarmerApp.swift
//  FarmtasticFarmer
//
//  Created by Dieu Vu on 4/3/22.
//

import SwiftUI

@main
struct FarmtasticFarmerApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject var authentication = Authentication()
    
    var body: some Scene {
        WindowGroup {
            //BaseView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
           
            if (authentication.isAuthenticated) || (KeychainHelper.standard.read(service: "auth-token", account: "farmtastic") != nil) {
                BaseView()
                    .environmentObject(authentication)
            } else {
                LoginView()
                    .environmentObject(authentication)
            }
            
        }
    }
}
