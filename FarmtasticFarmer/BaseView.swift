//
//  ContentView.swift
//  FarmtasticFarmer
//
//  Created by Dieu Vu on 4/3/22.
//  Tab view with navigation to main views

import SwiftUI
import CoreData

struct BaseView: View {

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
                .tabItem {
                    Image(systemName: "person.fill")
                    Text(Translation().Profile)
                }
                .tag(Constants.profileTab)
                .onAppear{
                    userController.fetchUser{
                        result in
                        switch result {
                        case .success(let user):
                            userController.currentUser = user
                        case .failure(let error):
                            //fatalError(error.localizedDescription)
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
//            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

// BELOW ARE SAMPLE CODE GENERATED BY XCODE
//struct ContentView: View {
//    @Environment(\.managedObjectContext) private var viewContext
//
//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
//        animation: .default)
//    private var items: FetchedResults<Item>
//
//    var body: some View {
//        NavigationView {
//            List {
//                ForEach(items) { item in
//                    NavigationLink {
//                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")
//                    } label: {
//                        Text(item.timestamp!, formatter: itemFormatter)
//                    }
//                }
//                .onDelete(perform: deleteItems)
//            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    EditButton()
//                }
//                ToolbarItem {
//                    Button(action: addItem) {
//                        Label("Add Item", systemImage: "plus")
//                    }
//                }
//            }
//            Text("Select an item")
//        }
//    }
//
//    private func addItem() {
//        withAnimation {
//            let newItem = Item(context: viewContext)
//            newItem.timestamp = Date()
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            offsets.map { items[$0] }.forEach(viewContext.delete)
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//}
//
//private let itemFormatter: DateFormatter = {
//    let formatter = DateFormatter()
//    formatter.dateStyle = .short
//    formatter.timeStyle = .medium
//    return formatter
//}()
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//    }
//}
