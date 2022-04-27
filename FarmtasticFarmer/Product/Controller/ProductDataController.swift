//
//  ProductDataController.swift
//  FarmtasticFarmer
//
//  Created by Dieu Vu on 4/24/22.
//

import Foundation


import Foundation
import UIKit
import CoreData
import SwiftUI

class ProductDataController: UIViewController, ObservableObject {
    
    @Published var products: [ProductFromApi] = []
    
    let context = PersistenceController.shared.container.viewContext
    
    
    func fetchProduct (completion: @escaping(Result<[ProductFromApi], Error>)-> Void) {
        print("FETCHED PRODUCTS \(self.products)")
        
        DispatchQueue.global(qos: .userInteractive).sync {
            do {
                let userRequest = WebService()
                userRequest.getProducts { result in
                    switch result {
                    case .failure(let error):
                        print("FAILURE \(error)")
                        completion(.failure(error))
                    case .success(let products):
                        DispatchQueue.main.sync {
                            self.products = products
                            print(products.count)
                            if (products.count > 0){
                                let string_test = products[0].description.product_name
                                print("product extra info: \(string_test)")
                                self.saveProducts(context: self.context, products: products)
                            }
                        }
                    }}
                completion(.success(self.products))
            }
        }
    }
    
    func saveProducts(context: NSManagedObjectContext, products: [ProductFromApi]){
        //save fetched products to core data
        for product in products {
            let productsFetched = ProductFetched(context: context)
            productsFetched.product_id = Int64(product.file_id)
            productsFetched.product_name = product.description.product_name
            productsFetched.category = product.description.category
            productsFetched.harvest_date = Utils.utils.convertDateFromApi(product.description.harvest_date)
            productsFetched.selling_quantity = Double(product.description.selling_quantity) ?? 0.00
            productsFetched.unit = product.description.unit
            productsFetched.unit_price = Double(product.description.unit_price) ?? 0.00
            productsFetched.sold_in_cart = NSSet()
            do {
                try context.save()
                print("product fetched from API saved to coredata")
            } catch {
                UserDefaults.standard.setValue(true, forKey: Constants.productsLoaded)
            }
        }
    }
    
    func addProduct(description: ProductJSON, image: Data){
        // parse product info from add product form to a ProductExtraInfo object
        var product = ProductExtraInfo()
        product.product_name = description.product_name ?? ""
        product.category = description.category ?? ""
        product.selling_quantity = String(format: "%.2f", description.selling_quantity!)
        product.unit = description.unit ?? ""
        product.unit_price = String(format: "%.2f", description.unit_price!)
        let newProductString = String(data: try! JSONEncoder().encode(product), encoding: .utf8)
        print("NEW PRODUCT DESCRIPTION STRING", newProductString)
        print("NEW PRODUCT IMAGE DATA", image)

        // parse JSON for POST method in WebService
        
        // call Webservice POST method
        
    }
    
    
}
