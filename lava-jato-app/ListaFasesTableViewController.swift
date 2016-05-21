//
//  ListaFasesTableViewController.swift
//  lava-jato-app
//
//  Created by Roberson Fleck on 4/30/16.
//  Copyright © 2016 Roberson Fleck. All rights reserved.
//

import UIKit

class ListaFasesTableViewController: UITableViewController {
    var anos:Array<Int> = [2013, 2014, 2015, 2016]
    var faseRepository:FaseRepository!
    var fases:Array<Fase> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.faseRepository = FaseRepository()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.refresh()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.anos.count
    }
    
    func fasesDoAno(ano:Int) -> Array<Fase> {
        var result:Array<Fase> = []
        
        for fase in self.fases {
            if fase.anoFase == ano {
                result.append(fase)
            }
        }
        return result
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.fasesDoAno(self.anos[section]).count
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return String(self.anos[section])
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let section:Int = indexPath.section
        let row:Int = indexPath.row
        let fase:Fase = self.fasesDoAno(self.anos[section])[row]
        
        let cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cellFases")
        
        cell.textLabel?.text = "\(fase.numero!): \(fase.codinome!) (\(fase.anoFase!))"
        cell.detailTextLabel?.text = fase.descricao!
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let section:Int = indexPath.section
        let row:Int = indexPath.row
        let fase:Fase = self.fasesDoAno(self.anos[section])[row]
        
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
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .Destructive, title: "Delete") { (action, indexPath) in
            let row:Int = indexPath.row
            let fase:Fase = self.fases[row]
            
            self.faseRepository.remover(fase)
            self.refresh()
        }
        
        let edit = UITableViewRowAction(style: .Normal, title: "Edit") { (action, indexPath) in
            let row:Int = indexPath.row
            let fase:Fase = self.fases[row]
            
            let mainStoryBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
            let editarFase:NovaFaseTableViewController = mainStoryBoard.instantiateViewControllerWithIdentifier("novaFase") as! NovaFaseTableViewController
            
            editarFase.faseEditar = fase
            
            if let navigation = self.navigationController{
                navigation.pushViewController(editarFase, animated: true)
            }
        }
        
        let share = UITableViewRowAction(style: .Normal, title: "Share") { (action, indexPath) in
        }
        
        edit.backgroundColor = UIColor.blueColor()
        share.backgroundColor = UIColor.greenColor()
        
        return [delete, edit, share]
    }
    
    func refresh() {
        self.fases = self.faseRepository.listar()
        self.tableView.reloadData()
    }
}
