//
//  Product.swift
//  FarmtasticFarmer
//
//  Created by Trang on 7.4.2022.
//

import Foundation

struct Product {
    var name: String
    var image: String
    var pricePerUnit: String
    var Category: String
}

extension Product {
    static let sampleProductsList: [Product] =
        [
            Product(name: "Brocoli", image: "Brocoli", pricePerUnit: "3€/kg", Category: "Vegetables"),
            Product(name: "Apple", image: "Apple", pricePerUnit: "3€/kg", Category: "Fruit"),
            Product(name: "Beef", image:"Beef" , pricePerUnit: "15€/kg", Category: "Meat"),
            Product(name: "Brocoli", image: "Brocoli", pricePerUnit: "3€/kg", Category: "Vegetables"),
            Product(name: "Apple", image: "Apple", pricePerUnit: "3€/kg", Category: "Fruit"),
            Product(name: "Beef", image:"Beef" , pricePerUnit: "15€/kg", Category: "Meat"),
            Product(name: "Brocoli", image: "Brocoli", pricePerUnit: "3€/kg", Category: "Vegetables"),
            Product(name: "Apple", image: "Apple", pricePerUnit: "3€/kg", Category: "Fruit"),
            Product(name: "Beef", image:"Beef" , pricePerUnit: "15€/kg", Category: "Meat"),
        ]
}
