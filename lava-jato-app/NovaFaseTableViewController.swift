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
    var faseRepository:FaseRepository!
    var faseEditar:Fase!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.faseRepository = FaseRepository()
        
        if faseEditar == nil {
            self.title = "Nova Fase"
            self.numeroTextField.text = "10"
            self.codinomeTextField.text = "Nova Fase"
            self.anoTextField.text = "2020"
            self.descTextField.text = "Desc Nova Fase"
        }
        else {
            self.title = "Editar Fase"
            self.numeroTextField.text = String(faseEditar.numero!)
            self.codinomeTextField.text = faseEditar.codinome!
            self.anoTextField.text = String(faseEditar.anoFase!)
            self.descTextField.text = faseEditar.descricao!
        }
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
        if self.faseEditar == nil {
            let novaFase:Fase = self.faseRepository.novaInstancia()
            
            novaFase.numero = Int(self.numeroTextField.text!)
            novaFase.codinome = self.codinomeTextField.text!
            novaFase.anoFase = Int(self.anoTextField.text!)
            novaFase.descricao = self.descTextField.text!
        } else {
            self.faseEditar.numero = Int(self.numeroTextField.text!)
            self.faseEditar.codinome = self.codinomeTextField.text!
            self.faseEditar.anoFase = Int(self.anoTextField.text!)
            self.faseEditar.descricao = self.descTextField.text!
        }
        
        self.faseRepository.salvar()
        
        // 2 - Fechar a Tela
        if let navigation = self.navigationController {
            navigation.popViewControllerAnimated(true)
        }
    }
}
