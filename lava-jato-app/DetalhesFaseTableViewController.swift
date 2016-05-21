//
//  DetalhesFaseTableViewController.swift
//  lava-jato-app
//
//  Created by Roberson Fleck on 4/30/16.
//  Copyright © 2016 Roberson Fleck. All rights reserved.
//

import UIKit

class DetalhesFaseTableViewController: UITableViewController {

    @IBOutlet weak var numeroLabel: UILabel!
    @IBOutlet weak var codinomeLabel: UILabel!
    @IBOutlet weak var anoLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    var fase:Fase?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let fase = self.fase{
            self.numeroLabel.text = "Fase: \(String(fase.numero!))"
            self.codinomeLabel.text = "Codinome: \(fase.codinome!)"
            self.anoLabel.text = "Ano: \(String(fase.anoFase!))"
            self.descLabel.text = "Detalhes: \(fase.descricao!)"
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
}
