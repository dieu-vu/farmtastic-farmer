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

public class ActiveOrderLoader: ObservableObject {
    @Published var activeOrders = [ActiveOrder]()

    init() {
        loadData()
    }

    func loadData() {
        let path = Bundle.main.path(forResource: "orders", ofType: "json")
        let url = URL(fileURLWithPath: path!)

        do {
            let data = try Data(contentsOf: url)
            let json = try JSONDecoder().decode([ActiveOrder].self, from: data)
            self.activeOrders = json
        } catch {
            print(error)
        }
    }
}
