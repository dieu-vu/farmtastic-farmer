//
//  ProductDataController.swift
//  FarmtasticFarmer
//
//  Created by Dieu Vu on 4/24/22.

// Class to handle data processes related to products between WebService and UI

import Foundation
import UIKit
import CoreData
import SwiftUI

class ProductDataController: UIViewController, ObservableObject {
    
    @Published var products: [ProductFromApi] = []
    
    @Published var allProducts: [ProductFetched] = []
    @Published var meatProductList: [ProductFetched] = []
    @Published var vegeProductList: [ProductFetched] = []
    @Published var fruitProductList: [ProductFetched] = []
    @Published var dairyProductList: [ProductFetched] = []
    
    @Published var searchResultProductList: [ProductFetched] = []
    
    @Published var loadCompleted: Bool = false
    
    let context = PersistenceController.shared.container.viewContext
    
    // Fetch product info from network ans save to Core Data
    func loadProducts(completion: @escaping(Result<[ProductFetched], Error>)-> Void) {
        print("LOADED PRODUCTS \(self.products)")
        
        DispatchQueue.global(qos: .userInteractive).sync {
            do {
                let userRequest = WebService()
                userRequest.getProducts { result in
                    switch result {
                    case .failure(let error):
                        print("FAILURE \(error)")
                        completion(.failure(error))
                    case .success(let products):
                        // Clear product data table
                        self.clearProductCoreData(context: self.context)
                        DispatchQueue.main.sync {
                            self.products = products
                            print("PRODUCT LOADED FROM API COUNT", products.count)
                            if (products.count > 0){
                                let string_test = products[0].description.product_name
                                print("test product extra info: \(string_test)")
                                // Save products loaded from API to core data
                                self.saveProducts(context: self.context, products: products)
                            }
                            // Fetch Product from Core Data
                            self.allProducts = self.fetchAllProducts()
                            self.vegeProductList = self.getProductsByCategory(category: "vegetables")
                            self.meatProductList = self.getProductsByCategory(category: "meat")
                            self.fruitProductList = self.getProductsByCategory(category: "fruit")
                            self.dairyProductList = self.getProductsByCategory(category: "egg")
                            self.loadCompleted = true
                        }
                    }}
                completion(.success(self.allProducts))
            }
        }
    }
    
    
    // Function to save Products to Core Data (as ProductFetched object)
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
            productsFetched.image = loadImageFrom(filename: product.filename)
            //            print("product fetched image data ", productsFetched.image)
            do {
                try context.save()
                //                print("product fetched from API saved to coredata")
            } catch {
                UserDefaults.standard.setValue(true, forKey: Constants.productsLoaded)
            }
        }
    }
    
    // Function to handle data from Add Product Form and call POST request to the API
    func addProduct(description: ProductJSON, image: UIImage){
        // parse product info from add product form to a ProductExtraInfo object
        var product = ProductExtraInfo()
        product.product_name = description.product_name ?? ""
        product.category = description.category ?? ""
        product.harvest_date = description.harvest_date ?? ""
        product.selling_quantity = String(format: "%.2f", description.selling_quantity!)
        product.unit = description.unit ?? ""
        product.unit_price = String(format: "%.2f", description.unit_price!)
        
        let encoder = JSONEncoder()
        encoder.outputFormatting = .sortedKeys
        
        let newProduct = try! encoder.encode(product)
        let newProductString = String(data: newProduct, encoding: .utf8)!
        print("NEW PRODUCT DESCRIPTION STRING", newProductString)
        print("NEW PRODUCT IMAGE DATA", image)
        
        // Parse JSON for POST method in WebService: multipart/form-data
        // API doc: https://media.mw.metropolia.fi/wbma/docs/#api-Media-PostMediaFile
        let productDataDict: [String: String] = ["title": "farmtastic2022", "description": newProductString]
        let dataBody = createDataBody(withParameters: productDataDict, image: image)
        let boundary = dataBody["boundary"]
        let requestData = dataBody["dataBody"]
        
        // call Webservice POST method
        WebService().uploadProduct(dataBody: requestData as! Data, boundary: boundary as! String)
    }
    
    // Function to fetch products from Core Data
    func fetchAllProducts() -> [ProductFetched] {
        do {
            let request = ProductFetched.fetchRequest() as NSFetchRequest<ProductFetched>
            let productsFromCoreData = try context.fetch(request)
            print("PRODUCT FETCHED FROM CORE DATA COUNT",productsFromCoreData.count)
            //            productsFromCoreData.forEach{ product in
            //                print("product in CD: \(product.product_name), \(product.unit_price)")
            //            }
            return productsFromCoreData
        }
        catch {
            print("Cannot fetch products from Core Data")
            return []
        }
    }
    
    // Function to sort and filter products from Core Data based on given condition
    func getProductsByCategory (category: String) -> [ProductFetched]{
        do {
            let request = ProductFetched.fetchRequest() as NSFetchRequest<ProductFetched>
            
            let pred = NSPredicate(format: "category contains[cd] %@", category )
            request.predicate = pred
            let sort = NSSortDescriptor(key: "harvest_date", ascending: true)
            request.sortDescriptors = [sort]
            
            let groupProducts = try context.fetch(request)
            if (groupProducts.count > 0 ){
                print("RETRIEVE PRODUCTS BY CATEGORY", groupProducts.count)
                //                print("RETRIEVE PRODUCTS BY CATEGORY", groupProducts.last?.product_name!)
            }
            return groupProducts
        } catch {
            print("Cannot fetch products by category from Core Data")
            return []
        }
    }
    
    // Function to search product by dictation transcript
    func getProductBySearchPhrase (searchPhrase: String) {
        do {
            let request = ProductFetched.fetchRequest() as NSFetchRequest<ProductFetched>
            
            let pred = NSPredicate(format: "category contains[cd] %@ or product_name contains[cd] %@", searchPhrase, searchPhrase)
            request.predicate = pred
            let sort = NSSortDescriptor(key: "harvest_date", ascending: true)
            request.sortDescriptors = [sort]
            
            let groupProducts = try context.fetch(request)
            if (groupProducts.count > 0 ){
                print("SEARCH PRODUCT RESULT", groupProducts.count)
//                print("RETRIEVE PRODUCTS BY CATEGORY", groupProducts.last?.product_name!)
            }
            self.searchResultProductList = groupProducts
            print("searchResultProductList",self.searchResultProductList.count)
        } catch {
            print("Cannot fetch products by category from Core Data")
            self.searchResultProductList = []
        }
    }
    
    
    
    // ----------- HELPERS ------------ //
    // Function to prepare multipart/form-data body for the POST request
    func createDataBody(withParameters params: [String: String]?, image: UIImage) -> [String: Any] {
        let lineBreak = "\r\n"
        var body = Data()
        let boundary = "Boundary-\(NSUUID().uuidString)"
        print("BUILDING REQUEST BODY INIT", String(data: body, encoding: .utf8)!)
        
        guard let mediaImage = Media(withImage: image, forKey: "file") else { return ["dataBody": Data()] }
        print("BUILDING REQUEST BODY MEDIA DATA", mediaImage.data)
        
        
        if let parameters = params {
            for (key, value) in parameters {
                body.append("--\(boundary + lineBreak)")
                body.append("Content-Disposition: form-data; name=\"\(key)\"\(lineBreak + lineBreak)")
                body.append("\(value + lineBreak)")
            }
        }
        
        body.append("--\(boundary + lineBreak)".data(using: .utf8)!)
        body.append("Content-Disposition: form-data; name=\"\(mediaImage.key)\"; filename=\"\(mediaImage.fileName)\"\(lineBreak)".data(using: .utf8)!)
        body.append("Content-Type: \(mediaImage.mimeType + lineBreak + lineBreak)".data(using: .utf8)!)
        body.append(mediaImage.data)
        body.append(lineBreak.data(using: .utf8)!)
        body.append("--\(boundary)--\(lineBreak)".data(using: .utf8)!)
        
        print("BUILDING REQUEST BODY", body.description)
        let returnDict = ["dataBody": body, "boundary": boundary] as [String : Any]
        return returnDict
    }
    
    // Function to load image data from API
    func loadImageFrom (filename: String) -> Data? {
        let uploadUrl = Constants.uploadUrl + filename
        guard let url = URL(string: uploadUrl) else { return Data()}
        let loadedImageData = try! Data(contentsOf: url)
        return loadedImageData
    }
    
    
    // Function to delete objects in batch
    func clearProductCoreData(context: NSManagedObjectContext) {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "ProductFetched")
        let deleteRequest = NSBatchDeleteRequest(
            fetchRequest: fetchRequest
        )
        // Specify the result of the NSBatchDeleteRequest
        // should be the NSManagedObject IDs for the deleted objects
        deleteRequest.resultType = .resultTypeObjectIDs
        // Perform the batch delete
        let batchDelete = try! context.execute(deleteRequest) as? NSBatchDeleteResult
        
        guard let deleteResult = batchDelete?.result as? [NSManagedObjectID]
        else { return }
        
        let deletedObjects: [AnyHashable: Any] = [NSDeletedObjectsKey: deleteResult]
        
        // Merge the delete changes into the managed
        // object context
        NSManagedObjectContext.mergeChanges(
            fromRemoteContextSave: deletedObjects,
            into: [context]
        )
    }
    
}


extension Data {
    mutating func append(_ string: String) {
        if let data = string.data(using: .utf8) {
            append(data)
        }
    }
}


struct Media {
    let key: String
    let fileName: String
    let data: Data
    let mimeType: String
    
    init?(withImage image: UIImage, forKey key: String) {
        self.key = key
        self.mimeType = "image/jpeg"
        self.fileName = "\(arc4random()).jpeg"
        
        guard let data = image.jpegData(compressionQuality: 0.1) else {
            print("convert image data failed")
            return nil
        }
        print("IMAGE DATA", data)
        
        self.data = data
    }
}

