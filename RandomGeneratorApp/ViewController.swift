//
//  ViewController.swift
//  RandomGeneratorApp
//
//  Created by Matthew Downey on 11/7/16.
//  Copyright © 2016 Matthew Downey. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {

    @IBOutlet var lowerBoundField: UITextField!
    @IBOutlet var upperBoundField: UITextField!
    @IBOutlet var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func generateRandomNum(with min: Int, and max: Int) -> Int {
        if max < min { return min }
        let randomNum = GKRandomDistribution(lowestValue: min, highestValue: max)
        return randomNum.nextInt()
    }
    
    @IBAction func generateRandom() {
        
        guard let minNum = lowerBoundField.text?.integer, let maxNum = upperBoundField.text?.integer else {
            // TODO show error alert
            return
        }
        
        let randomNum = generateRandomNum(with: minNum, and: maxNum)
        
        resultLabel.text = String(randomNum)
     }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    

}

extension String {
    var integer: Int? {
        return Int(self)
    }
}
