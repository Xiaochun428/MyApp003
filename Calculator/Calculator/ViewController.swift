//
//  ViewController.swift
//  Calculator
//
//  Created by tang chunyong on 3/20/19.
//  Copyright © 2019 Apple Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var userIsInTheMiddleTyping = false
    
    @IBOutlet weak var display: UILabel!
    
    @IBAction func touchDigit(_ sender: UIButton){
        
        let digit = sender.currentTitle!
        if userIsInTheMiddleTyping {
            let textCurrentlyInDisplay = display.text!
            
            //let is sort of local variable that could only use in local scope(put a variable inside a function that  only be use in this function).
            
            
            display.text = textCurrentlyInDisplay + digit
        }
            
        else {
            display.text = digit
            userIsInTheMiddleTyping = true
            
        }
    }
    
    var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    
    
    private var brain = CalculatorBrain()
    
    
    @IBAction func performOperation(_ sender: UIButton) {
        if userIsInTheMiddleTyping  {
            brain.setOperand(displayValue)
            userIsInTheMiddleTyping = false
        }
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(mathematicalSymbol)
        }
        if let result = brain.result {
            displayValue = result
        }
    }
}

