//
//  Location+CoreDataProperties.swift
//  FarmtasticFarmer
//
//  Created by Dieu Vu on 4/19/22.
//
//

import Foundation
import CoreData


extension Location {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Location> {
        return NSFetchRequest<Location>(entityName: "Location")
    }

    @NSManaged public var latitude: NSObject?
    @NSManaged public var longitude: NSObject?
    @NSManaged public var text_address: NSObject?
    @NSManaged public var location_id: Order?

}

extension Location : Identifiable {

}
