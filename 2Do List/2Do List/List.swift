//
//  List.swift
//  2Do List
//
//  Created by Nimarit Walia on 3/2/16.
//  Copyright © 2016 Nimarit Walia. All rights reserved.
//

import Foundation
import UIKit

class List: NSObject {
    var list = [String].self
    let date = NSDate()
    
    override init() {
        self.list = list
        self.data = date
        
        setDate()
        
        
    }
    
    func setDate() {
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([ .Hour, .Minute, .Second], fromDate: date)
        let hour = components.hour
        let minutes = components.minute
    }
}