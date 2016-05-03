//
//  ListaFasesTableViewController.swift
//  lava-jato-app
//
//  Created by Roberson Fleck on 4/30/16.
//  Copyright © 2016 Roberson Fleck. All rights reserved.
//

import UIKit

class ListaFasesTableViewController: UITableViewController {
    
    var faseDAO:FaseDAO!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.faseDAO = FaseDAO()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return faseDAO.listarTodos().count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row:Int = indexPath.row
        let fase:Fase = self.faseDAO.listarTodos()[row]
        let cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cellFases")
        
        //cell.textLabel?.text = fase.codinome
        cell.textLabel?.text = "\(fase.numero!): \(fase.codinome!) (\(fase.anoFase!))"
        cell.detailTextLabel?.text = fase.descricao!
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let row:Int = indexPath.row
        let fase:Fase = self.faseDAO.listarTodos()[row]
        
        let mainStoryBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let detalhes:DetalhesFaseTableViewController = mainStoryBoard.instantiateViewControllerWithIdentifier("detalhesFase") as!DetalhesFaseTableViewController
        
        detalhes.fase = fase
        
        if let navigation = self.navigationController{
            navigation.pushViewController(detalhes, animated: true)
            
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "novaFaseSegue" {
            let novaFaseTVC:NovaFaseTableViewController = segue.destinationViewController as! NovaFaseTableViewController
            novaFaseTVC.delegate = self
        }
    }
    func novaFaseAdicionada(novaFase:Fase) -> Void {
        faseDAO.incluir(novaFase)
        self.tableView.reloadData()
    }
}
