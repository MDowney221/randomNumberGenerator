//
//  ThemeViewController.swift
//  RandomGeneratorApp
//
//  Created by Matthew Downey on 11/14/16.
//  Copyright © 2016 Matthew Downey. All rights reserved.
//


import UIKit

class ThemeViewController: UIViewController {
    
    @IBOutlet var stepper: UIStepper!
    @IBOutlet var stepperValue: UILabel!
    
    
    @IBAction func shortAlert() {
        
//        self.contentView.backgroundColor = Style.sectionHeaderBackgroundColor
//        self.contentView.alpha = Style.sectionHeaderAlpha
//        let title = UILabel()
//        title.textColor = Style.sectionHeaderTitleColor
//        title.font = Style.sectionHeaderTitleFont
        
        let message = "Alert Alert!"
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func showActionSheet() {
        
        let actionSheetController = UIAlertController(title: "Action Sheet", message: "Select an action", preferredStyle: .actionSheet)
        
        let sendButton = UIAlertAction(title: "Send Action", style: .default, handler: { (action) -> Void in
            print("Sending...")
        })
            
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) -> Void in
            print("Cancelling...")
        })
            
        actionSheetController.addAction(sendButton)
        actionSheetController.addAction(cancelButton)
        
        present(actionSheetController, animated: true, completion: nil)
    }
    
    @IBAction func stepperAction(sender: UIStepper) {
        stepperValue.text = "Step: \(Int(stepper.value))"
    }
    
    @IBAction func switchTheme(sender: UISwitch) {
        // When on
        
        self.view.backgroundColor = .black
        
    }
    
}
