//
//  Fase+CoreDataProperties.swift
//  lava-jato-app
//
//  Created by Roberson Fleck on 4/30/16.
//  Copyright © 2016 Roberson Fleck. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Fase {

    @NSManaged var numero: NSNumber?
    @NSManaged var anoFase: NSNumber?
    @NSManaged var codinome: String?
    @NSManaged var descricao: String?

}
