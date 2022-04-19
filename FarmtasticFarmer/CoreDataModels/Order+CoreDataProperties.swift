//
//  Order+CoreDataProperties.swift
//  FarmtasticFarmer
//
//  Created by Dieu Vu on 4/16/22.
//
//

import Foundation
import CoreData


extension Order {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Order> {
        return NSFetchRequest<Order>(entityName: "Order")
    }

    @NSManaged public var order_date: Date?
    @NSManaged public var order_id: UUID?
    @NSManaged public var pickup_date: Date?
    @NSManaged public var pickup_location: Int16
    @NSManaged public var items: NSSet?
//    @NSManaged public var user: UserFetched?

}

// MARK: Generated accessors for items
extension Order {

    @objc(addItemsObject:)
    @NSManaged public func addToItems(_ value: CartItem)

    @objc(removeItemsObject:)
    @NSManaged public func removeFromItems(_ value: CartItem)

    @objc(addItems:)
    @NSManaged public func addToItems(_ values: NSSet)

    @objc(removeItems:)
    @NSManaged public func removeFromItems(_ values: NSSet)

}

extension Order : Identifiable {

}
