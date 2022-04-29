//
//  ProductJSON.swift
//  FarmtasticFarmer
//
//  Created by Dieu Vu on 4/26/22.
// Struct to parse Product extra information for tasks related to product update

import Foundation

// struct for product data from Add product form
struct ProductJSON: Codable {
    var product_name: String?
    var category: String?
    var harvest_date: String?
    var selling_quantity: Double?
    var unit: String?
    var unit_price: Double?
}


struct ProductUploadData: Codable {
    let description: String
}
