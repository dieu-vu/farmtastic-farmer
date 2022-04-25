//
//  ActiveOrder.swift
//  FarmtasticFarmer
//
//  Created by Giang Nguyen on 21.4.2022.
//

import Foundation

struct Item: Codable {
    let id: Int
    let name: String
    let sold_quantity: String
}

struct ActiveOrder: Codable {
    let order_id: Int
    var order_date: String
    var pickup_date: String
    var pickup_location: Int
    var items: [Item]
}

