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
    
    func addProduct(description: ProductJSON, image: UIImage){
        // parse product info from add product form to a ProductExtraInfo object
        var product = ProductExtraInfo()
        product.product_name = description.product_name ?? ""
        product.category = description.category ?? ""
        product.harvest_date = description.harvest_date ?? ""
        product.selling_quantity = String(format: "%.2f", description.selling_quantity!)
        product.unit = description.unit ?? ""
        product.unit_price = String(format: "%.2f", description.unit_price!)
        let newProduct = try! JSONEncoder().encode(product)
        print("NEW PRODUCT DESCRIPTION JSON", newProduct)
        
        let newProductString = String(data: newProduct, encoding: .utf8)!
        print("NEW PRODUCT DESCRIPTION STRING", newProductString)
        print("NEW PRODUCT DESCRIPTION STRING", type(of:newProductString))
        
        print("NEW PRODUCT IMAGE DATA", image)
        
        // Parse JSON for POST method in WebService: multipart/form-data
        // API doc: https://media.mw.metropolia.fi/wbma/docs/#api-Media-PostMediaFile
        // Title: string "farmtastic2022", description: stringified of ProductExtraInfo object
        let newProductInfoEncoded = String(data: try! JSONEncoder().encode(newProductString), encoding: .utf8)!
        print("new product string encoded", newProductInfoEncoded)

        let productDataDict: [String: String] = ["title": "farmtastic2022", "description": newProductInfoEncoded]
        let dataBody = createDataBody(withParameters: productDataDict, image: image)
        let boundary = dataBody["boundary"]
        print("BOUNDARY", boundary)
        
        let requestData = dataBody["dataBody"]
        print("Data BODY", requestData)
        
        // call Webservice POST method
        WebService().uploadProduct(dataBody: requestData as! Data, boundary: boundary as! String)
    }
    
    
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
