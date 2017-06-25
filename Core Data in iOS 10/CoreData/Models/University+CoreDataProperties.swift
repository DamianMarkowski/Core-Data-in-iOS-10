//
//  University+CoreDataProperties.swift
//  Core Data in iOS 10
//
//  Created by Damian Markowski on 25.06.2017.
//  Copyright © 2017 Damian Markowski. All rights reserved.
//

import Foundation
import CoreData


extension University {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<University> {
        return NSFetchRequest<University>(entityName: "University")
    }

    @NSManaged public var name: String?
    @NSManaged public var country: String?
    @NSManaged public var numberOfStudents: Int64
    @NSManaged public var isPublic: Bool

}
