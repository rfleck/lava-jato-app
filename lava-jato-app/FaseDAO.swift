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

class FaseDAO{
    var fases:Array<Fase> = []
    
    func listarTodos() -> Array<Fase> {
        let context = (UIApplication.sharedApplication().delegate as!AppDelegate).managedObjectContext
        let request = NSFetchRequest(entityName: "Fase")
        
        var fases:Array<Fase>
        
        do {
            fases = try context.executeFetchRequest(request) as! [Fase]
            
        } catch _ {
            fases = []
        }
        
        return fases
    }
    
    func listarPorNumero(numero:Int) -> Fase {
        return Fase()
    }
    
    func incluir(fase:Fase) -> Fase {
        self.fases.append(fase)
        return fase
    }
    
    func editar(fase:Fase) -> Fase {
        return fase
    }
    
    func remover(fase:Fase) -> Void {
        
    }
    
    func removerPorNumero(numero:Int) -> Void {
        
    }
}
