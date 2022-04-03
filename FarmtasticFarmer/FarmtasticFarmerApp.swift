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

    var body: some Scene {
        WindowGroup {
            BaseView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
