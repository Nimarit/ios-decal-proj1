//
//  ToDoListTableViewController.swift
//  2Do List
//
//  Created by Nimarit Walia on 3/1/16.
//  Copyright © 2016 Nimarit Walia. All rights reserved.
//

import Foundation
import UIKit

class ToDoListTableViewController: UITableViewController {
    
    var deleteItem: String? = ""
    var deleteItemIP: NSIndexPath? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var index = 0
        while index < expiredDate.count {
            if expiredDate[index] == nil {
                break
            }
            if checkOrNah[index] && expiredDate[index]!.timeIntervalSinceNow / 3600 >= 24 {
                model.removeAtIndex(index)
                date.removeAtIndex(index)
                expiredDate.removeAtIndex(index)
                checkOrNah.removeAtIndex(index)
                numberOfCheckedItems -= 1
            }
            index++
        }
        
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
            model.append(myAddItemVC.textField.text!)
            date.append(NSDate())
            expiredDate.append(nil)
            checkOrNah.append(false)
            myAddItemVC.textField.text = ""
            self.view.endEditing(true)
            self.tableView.reloadData()
        }
    }
    // Source from Andrew Bancroft    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            deleteItemIP = indexPath
            deleteItem = model[indexPath.row]
            confirmDelete(deleteItem!)
        }
    }

    struct ScreenSize
    {
    static let SCREEN_WIDTH         = UIScreen.mainScreen().bounds.size.width
    static let SCREEN_HEIGHT        = UIScreen.mainScreen().bounds.size.height
    static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    }
    
    struct DeviceType
    {
        static let IS_IPHONE_4_OR_LESS  = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
        static let IS_IPHONE_5          = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
        static let IS_IPHONE_6          = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
        static let IS_IPHONE_6P         = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
        static let IS_IPAD              = UIDevice.currentDevice().userInterfaceIdiom == .Pad && ScreenSize.SCREEN_MAX_LENGTH == 1024.0
    }
    
    func confirmDelete(item: String) {
        let alert = UIAlertController(title: "Delete Item", message: "Are you sure you want to permanently delete this item?", preferredStyle: .ActionSheet)
        
        let DeleteAction = UIAlertAction(title: "Delete", style: .Destructive, handler: deleteItemAction)
        let CancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: cancelItemAction)
        
        alert.addAction(DeleteAction)
        alert.addAction(CancelAction)
        
        if DeviceType.IS_IPAD {
            alert.popoverPresentationController?.sourceView = self.view
            alert.popoverPresentationController?.sourceRect = CGRectMake(self.view.bounds.size.width / 2.0, self.view.bounds.size.height / 2.0, 1.0, 1.0)
        }
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func deleteItemAction(alertAction: UIAlertAction!) {
        if let indexPath = deleteItemIP {
            tableView.beginUpdates()
            
            model.removeAtIndex(indexPath.row)
            date.removeAtIndex(indexPath.row)
            expiredDate.removeAtIndex(indexPath.row)
            checkOrNah.removeAtIndex(indexPath.row)

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
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.textLabel?.text = model[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = NSLineBreakMode.ByWordWrapping
        
        let formatter = NSDateFormatter()
        formatter.timeStyle = .ShortStyle
        cell.detailTextLabel?.text = formatter.stringFromDate(date[indexPath.row])
        
        if checkOrNah[indexPath.row] {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if checkOrNah[indexPath.row] {
            checkOrNah[indexPath.row] = false
            expiredDate[indexPath.row] = nil
            numberOfCheckedItems -= 1
        } else {
            checkOrNah[indexPath.row] = true
            expiredDate[indexPath.row] = NSDate()
            numberOfCheckedItems++
        }
        
        tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
}

