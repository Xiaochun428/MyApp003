//
//  ViewController.swift
//  Calculator
//
//  Created by tang chunyong on 3/20/19.
//  Copyright © 2019 Apple Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    var userIsInTheMiddleTyping = false
    
    @IBOutlet weak var display: UILabel!
    
    @IBAction func touchDigit(_ sender: UIButton){
        
        let digit = sender.currentTitle!
        if userIsInTheMiddleTyping {
            let textCurrentlyInDisplay = display.text!
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
    } //edit
}

