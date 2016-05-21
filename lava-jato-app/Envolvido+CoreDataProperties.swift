//
//  Envolvido+CoreDataProperties.swift
//  lava-jato-app
//
//  Created by Roberson Fleck on 5/7/16.
//  Copyright © 2016 Roberson Fleck. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Envolvido {

    @NSManaged var nome: String?
    @NSManaged var idade: NSNumber?

}
