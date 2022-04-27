//
//  ProductFromAPI.swift
//  FarmtasticFarmer
//
//  Created by Dieu Vu on 4/24/22.
//

import Foundation

struct ProductFromApi: Codable {
    let file_id: Int
    var user_id: Int
    var filename: String
    var filesize: Int
    var title: String
    var description: ProductExtraInfo
    var media_type: String
    var mime_type: String
    var time_added: String
}


struct ProductExtraInfo: Codable {
    var product_name: String = ""
    var category: String = ""
    var harvest_date: String = ""
    var selling_quantity: String = ""
    var unit: String = ""
    var unit_price: String = ""
}

// Blank data to init the object at the beginning
extension ProductFromApi {
    static let initData: ProductFromApi = ProductFromApi(file_id: 0, user_id: 0, filename: "", filesize: 0, title: "", description: ProductExtraInfo(product_name: "init", category: "init", harvest_date: "NSDate().timeIntervalSince1970", selling_quantity: "0.0", unit: "unit", unit_price: "0.0"), media_type: "", mime_type: "", time_added: "")
}
