//
//  NovaFaseTableViewController.swift
//  lava-jato-app
//
//  Created by Roberson Fleck on 4/30/16.
//  Copyright © 2016 Roberson Fleck. All rights reserved.
//

import UIKit
import CoreData

class NovaFaseTableViewController: UITableViewController {

    @IBOutlet weak var numeroTextField: UITextField!
    @IBOutlet weak var codinomeTextField: UITextField!
    @IBOutlet weak var anoTextField: UITextField!
    @IBOutlet weak var descTextField: UITextField!
    
    var delegate:ListaFasesTableViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.numeroTextField.text = "3"
        self.codinomeTextField.text = "Fase 3"
        self.anoTextField.text = "2017"
        self.descTextField.text = "Desc Fase 3"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    @IBAction func actionSalvar(sender: AnyObject) {
        let context = (UIApplication.sharedApplication().delegate as!AppDelegate).managedObjectContext
        let novaFase:Fase = NSEntityDescription.insertNewObjectForEntityForName("Fase", inManagedObjectContext: context) as! Fase
        
        novaFase.numero = Int(self.numeroTextField.text!)
        novaFase.codinome = self.codinomeTextField.text!
        novaFase.anoFase = Int(self.anoTextField.text!)
        novaFase.descricao = self.descTextField.text!
        
        do {
            try context.save()
        } catch _ {
            
        }
        
        // 2 - Fechar a Tela
        if let navigation = self.navigationController {
            navigation.popViewControllerAnimated(true)
        }
        
        // 3 - Avisar a lista que uma nova fase foi adicionada
        delegate.novaFaseAdicionada(novaFase)
    }
}
