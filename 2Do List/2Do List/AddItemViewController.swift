//
//  AddItemViewController.swift
//  2Do List
//
//  Created by Nimarit Walia on 2/27/16.
//  Copyright © 2016 Nimarit Walia. All rights reserved.
//

import Foundation
import UIKit

var model = [String]()
var mondayModel = [String]()
var tuesdayModel = [String]()
var wednesdayModel = [String]()
var thursdayModel = [String]()
var fridayModel = [String]()
var saturdayModel = [String]()
var sundayModel = [String]()

var date = [NSDate]()
var expiredDate = [NSDate?]()
var checkOrNah = [Bool]()
var numberOfCheckedItems = 0

class AddItemViewController: UIViewController {
    
    @IBOutlet var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //For official structure, text will be written exclusively to the TableViewCell
    
}
