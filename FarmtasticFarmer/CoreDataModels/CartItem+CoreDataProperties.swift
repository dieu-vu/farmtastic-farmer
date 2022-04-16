//
//  CartItem+CoreDataProperties.swift
//  FarmtasticFarmer
//
//  Created by Dieu Vu on 4/16/22.
//
//

import Foundation
import CoreData


extension CartItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CartItem> {
        return NSFetchRequest<CartItem>(entityName: "CartItem")
    }

    @NSManaged public var sold_quantity: Double
    @NSManaged public var order: Order?
    @NSManaged public var product_id: ProductFetched?

}
