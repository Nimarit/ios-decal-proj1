//
//  HelpScreen.swift
//  2Do List
//
//  Created by Nimarit Walia on 3/2/16.
//  Copyright © 2016 Nimarit Walia. All rights reserved.
//

import Foundation
import UIKit

class HelpScreen: UIInputViewController {
    
    @IBOutlet var mondayButton: UIButton!
    @IBOutlet var tuesdayButton: UIButton!
    @IBOutlet var wednesdayButton: UIButton!
    @IBOutlet var thursdayButton: UIButton!
    @IBOutlet var fridayButton: UIButton!
    @IBOutlet var saturdayButton: UIButton!
    @IBOutlet var sundayButton: UIButton!
    
    var homeView: UIView!
    
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    var collision: UICollisionBehavior!
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animator = UIDynamicAnimator(referenceView: view)
        gravity = UIGravityBehavior(items: [mondayButton, tuesdayButton, wednesdayButton, thursdayButton, fridayButton, saturdayButton, sundayButton])
        animator.addBehavior(gravity)
        collision = UICollisionBehavior(items: [mondayButton, tuesdayButton, wednesdayButton, thursdayButton, fridayButton, saturdayButton, sundayButton])
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
    }
    
    override func viewDidLayoutSubviews() {
        configureButton(mondayButton)
        configureButton(tuesdayButton)
        configureButton(wednesdayButton)
        configureButton(thursdayButton)
        configureButton(fridayButton)
        configureButton(saturdayButton)
        configureButton(sundayButton)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
    
    override func textWillChange(textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
    }
    
    func configureButton(button: UIButton) {
        button.layer.cornerRadius = button.bounds.size.width / 2
        button.clipsToBounds = true
    }
    
}
