//
//  ProductFetched+CoreDataProperties.swift
//  FarmtasticFarmer
//
//  Created by Dieu Vu on 4/16/22.
//
//

import Foundation
import CoreData


extension ProductFetched {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductFetched> {
        return NSFetchRequest<ProductFetched>(entityName: "ProductFetched")
    }

    @NSManaged public var category: String?
    @NSManaged public var harvest_date: Date?
    @NSManaged public var product_id: Int64
    @NSManaged public var product_name: String?
    @NSManaged public var selling_quantity: Double
    @NSManaged public var unit: Double
    @NSManaged public var unit_price: Double
    @NSManaged public var sold_quantity: CartItem?

}

extension ProductFetched : Identifiable {

}
