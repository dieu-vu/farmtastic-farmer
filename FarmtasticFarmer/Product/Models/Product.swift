//
//  Product.swift
//  FarmtasticFarmer
//
//  Created by Trang on 7.4.2022.
//

import Foundation

struct ProductList {
    var name: String
    var image: String
    var pricePerUnit: String
    var Category: String
}

extension ProductList {
    static let sampleData: [ProductList] =
        [
            ProductList(name: "Brocoli", image: "Brocoli", pricePerUnit: "3€/kg", Category: "Vegetables"),
            ProductList(name: "Apple", image: "Apple", pricePerUnit: "3€/kg", Category: "Fruit"),
            ProductList(name: "Beef", image:"Beef" , pricePerUnit: "15€/kg", Category: "Meat"),
        ]
}
