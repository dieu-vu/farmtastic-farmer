//
//  ProductFetched+CoreDataProperties.swift
//  FarmtasticFarmer
//
//  Created by Dieu Vu on 4/24/22.
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
    @NSManaged public var image: Data?
    @NSManaged public var product_id: Int64
    @NSManaged public var product_name: String?
    @NSManaged public var selling_quantity: Double
    @NSManaged public var unit: String?
    @NSManaged public var unit_price: Double
//    @NSManaged public var sold_in_cart: NSSet?

}

extension ProductFetched {
    
    // Add computed props to calculate sold quantity
//    @NSManaged public var sold_quantity: Double {
//        get {
//            return sold_in_cart.map{$0.sold_quantity}.reduce(0, {$0 + $1})
//        }
//    }
}


extension ProductFetched : Identifiable {

}
