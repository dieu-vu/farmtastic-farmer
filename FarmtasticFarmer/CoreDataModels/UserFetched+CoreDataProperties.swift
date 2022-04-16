//
//  UserFetched+CoreDataProperties.swift
//  FarmtasticFarmer
//
//  Created by Dieu Vu on 4/16/22.
//
//

import Foundation
import CoreData


extension UserFetched {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserFetched> {
        return NSFetchRequest<UserFetched>(entityName: "UserFetched")
    }

    @NSManaged public var address: String?
    @NSManaged public var email: String?
    @NSManaged public var name: String?
    @NSManaged public var phone: String?
    @NSManaged public var type: Int16
    @NSManaged public var user_id: Int16
    @NSManaged public var username: String?
    @NSManaged public var orders: NSSet?

}

extension UserFetched : Identifiable {

}
