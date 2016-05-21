//
//  EnvolvidoRepository.swift
//  lava-jato-app
//
//  Created by Roberson Fleck on 5/7/16.
//  Copyright © 2016 Roberson Fleck. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class EnvolvidoRepository{
    var context:NSManagedObjectContext
    
    init(){
        self.context = (UIApplication.sharedApplication().delegate as!AppDelegate).managedObjectContext
    }
    
    func novaInstancia() -> Envolvido {
        let envolvido:Envolvido = NSEntityDescription.insertNewObjectForEntityForName("Envolvido", inManagedObjectContext: self.context) as! Envolvido
        return envolvido
    }
    
    func listar() -> Array<Envolvido> {
        let request = NSFetchRequest(entityName: "Envolvido")
        var envolvidos:Array<Envolvido>
        
        do {
            envolvidos = try context.executeFetchRequest(request) as! [Envolvido]
            
        } catch _ {
            envolvidos = []
        }
        
        return envolvidos
    }
    
    func salvar() -> Void {
        do {
            try self.context.save()
        } catch _ {
            //Tratamento de Erro
        }
    }
    
    func remover(envolvido:Envolvido) -> Void {
        self.context.deleteObject(envolvido)
        do {
            try self.context.save()
        } catch _ {
            //Tratamento de Erro
        }
    }
}

