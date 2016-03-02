//
//  AgendaViewController.swift
//  Schedj
//
//  Created by Nimarit Walia on 2/24/16.
//  Copyright © 2016 Nimarit Walia. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: UIInputViewController {
    
    @IBOutlet var toggleButton: UIButton!
    
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
    
    @IBAction func unwindToHomeViewController(segue: UIStoryboardSegue) {
        
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
    
//    func wasDragged (button : UIButton, event :UIEvent) {
//        let touch : UITouch = ((event.touchesForView(button)!.first! as UITouch))
//        let previousLocation : CGPoint = touch .previousLocationInView(button)
//        let location : CGPoint = touch .locationInView(button)
//        let delta_x :CGFloat = location.x - previousLocation.x
//        let delta_y :CGFloat = location.y - previousLocation.y
//        button.center = CGPointMake(button.center.x + delta_x,
//            button.center.y + delta_y);
//    }
    
}
