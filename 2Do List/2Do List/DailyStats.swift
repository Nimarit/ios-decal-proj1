//
//  DailyStats.swift
//  2Do List
//
//  Created by Nimarit Walia on 3/2/16.
//  Copyright © 2016 Nimarit Walia. All rights reserved.
//

import Foundation
import UIKit

class DailyStats: UIViewController {
    
    @IBOutlet var numberOfCompletedItems: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberOfCompletedItems.text = ("\(numberOfCheckedItems)")
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}