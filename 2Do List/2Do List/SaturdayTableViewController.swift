//
//  SaturdayTableViewController.swift
//  2Do List
//
//  Created by Nimarit Walia on 2/29/16.
//  Copyright © 2016 Nimarit Walia. All rights reserved.
//

import Foundation
import UIKit

class SaturdayTableViewController: UITableViewController {
    
    var deleteItem: String? = ""
    var deleteItemIP: NSIndexPath? = nil
    var count: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // initialize model here ONLY
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToTableViewController(segue: UIStoryboardSegue) {
        
    }
    
    @IBAction func unwindAfterSaving(segue: UIStoryboardSegue) {
        let myAddItemVC: AddItemViewController = segue.sourceViewController as! AddItemViewController
        if myAddItemVC.textField.text != nil {
            saturdayModel.append(myAddItemVC.textField.text!)
            myAddItemVC.textField.text = ""
            self.view.endEditing(true)
            self.tableView.reloadData()
        }
    }
    // Source from Andrew Bancroft
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            deleteItemIP = indexPath
            deleteItem = saturdayModel[indexPath.row]
            confirmDelete(deleteItem!)
        }
    }
    
    func confirmDelete(item: String) {
        let alert = UIAlertController(title: "Delete Item", message: "Are you sure you want to permanently delete this item?", preferredStyle: .ActionSheet)
        
        let DeleteAction = UIAlertAction(title: "Delete", style: .Destructive, handler: deleteItemAction)
        let CancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: cancelItemAction)
        
        alert.addAction(DeleteAction)
        alert.addAction(CancelAction)
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func deleteItemAction(alertAction: UIAlertAction!) {
        if let indexPath = deleteItemIP {
            tableView.beginUpdates()
            
            saturdayModel.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            deleteItemIP = nil
            
            tableView.endUpdates()
        }
    }
    
    func cancelItemAction(alertAction: UIAlertAction!) {
        deleteItemIP = nil
    }
    // end source
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true;
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = UIColor.clearColor()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "TableCell")
        cell.textLabel?.text = saturdayModel[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return saturdayModel.count
    }
    
}

