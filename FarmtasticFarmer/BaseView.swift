//
//  ContentView.swift
//  FarmtasticFarmer
//
//  Created by Dieu Vu on 4/3/22.
//  Tab view with navigation to main views

import SwiftUI
import CoreData

struct BaseView: View {
    @AppStorage("language")
    private var language = LocalizationService.shared.language

    @EnvironmentObject var userController: UserDataController
    @EnvironmentObject var authController: AuthenticationController
    @EnvironmentObject var productDataController: ProductDataController

    @Environment(\.managedObjectContext) private var viewContext
    @State private var tabSelection = 1

    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color("TabBarBackground"))
    }
    
    var body: some View {
        TabView (selection: $tabSelection){
            Home()
                .tabItem {
                    Image(systemName: "chart.pie.fill")
                    Text(Translation().Statistics)
                }
                .tag(Constants.homeTab)

            ProductMainScreen(tabSelection: $tabSelection, products: productDataController.allProducts)
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text(Translation().Product)
                }
                .tag(Constants.productTab)

            ProfileScreen()
                .environmentObject(userController)
                .tabItem {
                    Image(systemName: "person.fill")
                    //using Translation(translatedLanguage: language) triggers changing language immediately
                    Text(Translation(translatedLanguage: language).Profile)
                }
                .tag(Constants.profileTab)
                .onAppear{
                    userController.fetchUser{
                        result in
                        switch result {
                        case .success(let user):
                            userController.currentUser = user
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }
                    print("LOGGED IN USER: \($userController.currentUser)")
                }
            
        }
        .accentColor(Color("DarkGreen"))
            
    }
       
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}
