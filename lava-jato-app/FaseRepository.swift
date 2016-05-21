//
//  FaseDAO.swift
//  lava-jato-app
//
//  Created by Roberson Fleck on 4/30/16.
//  Copyright © 2016 Roberson Fleck. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class FaseRepository{
    var context:NSManagedObjectContext
    
    init(){
        self.context = (UIApplication.sharedApplication().delegate as!AppDelegate).managedObjectContext
    }
    
    func novaInstancia() -> Fase {
        let fase:Fase = NSEntityDescription.insertNewObjectForEntityForName("Fase", inManagedObjectContext: self.context) as! Fase
        return fase
    }
    
   func listar() -> Array<Fase> {
        let request = NSFetchRequest(entityName: "Fase")
        var fases:Array<Fase>
        
        do {
            fases = try context.executeFetchRequest(request) as! [Fase]
            
        } catch _ {
            fases = []
        }
        
        return fases
    }
    
    func salvar() -> Void {
        do {
            try self.context.save()
        } catch _ {
            //Tratamento de Erro
        }
    }
    
    func remover(fase:Fase) -> Void {
        self.context.deleteObject(fase)
        do {
            try self.context.save()
        } catch _ {
            //Tratamento de Erro
        }
    }
}
