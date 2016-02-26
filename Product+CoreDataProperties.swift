//
//  Product+CoreDataProperties.swift
//  ShoppingAssistant
//
//  Created by ROHIT GUPTA on 2/24/16.
//  Copyright © 2016 ROHIT GUPTA. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Product {

    @NSManaged var title: String?
    @NSManaged var store: String?
    @NSManaged var image: NSData?

}
