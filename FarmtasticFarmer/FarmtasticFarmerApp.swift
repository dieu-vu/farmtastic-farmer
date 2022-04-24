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
    @StateObject var authentication = AuthenticationController()
    

    var body: some Scene {
        WindowGroup {
            //BaseView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            //just for test
            //ProductResultView(products: ProductList.sampleData)
            NavigationView {
                ApplicationSwitcher()
            }
            .navigationViewStyle(.stack)
            .environmentObject(authentication)
            .environmentObject(UserDataController())
            .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

struct ApplicationSwitcher: View {
    
    @EnvironmentObject var authController: AuthenticationController
    let persistenceController = PersistenceController.shared
    
    var body: some View {
       if (KeychainHelper.standard.read(service: "auth-token", account: "farmtastic") != nil) {
            BaseView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
//            MapView()
           
        }
        else {
            LoginView()
        }
        
        /*if (authController.isLoggedIn) || (KeychainHelper.standard.read(service: "auth-token", account: "farmtastic") != nil) {
             BaseView()
 //                .environment(\.managedObjectContext, persistenceController.container.viewContext)
             //MapView()
         }
         else {
             LoginView()
         }*/
    }
}
