//
//  ViewController.swift
//  TipPro
//
//  Created by ANGELIE RAMDIAL on 6/23/16.
//  Copyright © 2016 ANGELIE RAMDIAL. All rights reserved.
//

import UIKit

//textFieldDelegate - on screen keyboard for text options
class ViewController: UIViewController, UITextFieldDelegate {
    //instance variables
    @IBOutlet weak var billAmountField: UITextField!
    @IBOutlet weak var tipSelector: UISegmentedControl!
    @IBOutlet weak var tipAmountField: UITextField!
    @IBOutlet weak var totalAmountField: UITextField!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billAmountField.delegate = self
        tipAmountField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    //button as action event
    @IBAction func calculateTip(sender: UIButton) {
        guard let billAmount = Double(billAmountField.text!) else {
            //show error
            billAmountField.text = ""
            tipAmountField.text = ""
            totalAmountField.text = ""
            return
        }
        
        var tipPercentage = 0.0
        
        switch tipSelector.selectedSegmentIndex {
        case 0:
            tipPercentage = 0.15
        case 1:
            tipPercentage = 0.18
        case 2:
            tipPercentage = 0.20
        default:
            break
        }
        
        let roundedBillAmount = round(100*billAmount)/100
        let tipAmount = roundedBillAmount * tipPercentage
        let roundedTipAmount = round(100*tipAmount)/100
        let totalAmount = roundedBillAmount + roundedTipAmount
        
        if (!billAmountField.editing) {
            billAmountField.text = String(format: "%.2f", roundedBillAmount)
        }
        tipAmountField.text = String(format: "%.2f", roundedTipAmount)
        totalAmountField.text = String(format: "%.2f", totalAmount)
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        if textField.tag == 1 {
            return false
        }
        else { return true
        }
    }

}

