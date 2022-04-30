//
//  FarmtasticFarmerApp.swift
//  FarmtasticFarmer
//
//  Created by Dieu Vu on 4/3/22.
//  Entry point for the app, showing Login view if not logged in and BaseView otherwise

import SwiftUI

@main
struct FarmtasticFarmerApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject var authentication = AuthenticationController()
    @StateObject var userController = UserDataController()
    @StateObject var productDataController = ProductDataController()
    
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ApplicationSwitcher()
            }
            .navigationViewStyle(.stack)
            .environmentObject(authentication)
            .environmentObject(userController)
            .environmentObject(productDataController)
            .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

struct ApplicationSwitcher: View {
    
    @EnvironmentObject var authController: AuthenticationController
    let persistenceController = PersistenceController.shared
    
    var body: some View {
        if (authController.isLoggedIn || KeychainHelper.standard.read(service: "auth-token", account: "farmtastic") != nil) {
            BaseView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        else {
            LoginView()
        }
    }
}
