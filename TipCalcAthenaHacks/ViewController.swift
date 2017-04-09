//
//  ViewController.swift
//  TipCalcAthenaHacks
//
//  Created by Katie Moreno on 4/8/17.
//  Copyright © 2017 Katie Moreno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //IBOutlets
    @IBOutlet weak var billAmountField: UITextField!
    @IBOutlet weak var tipPercent: UISegmentedControl!
    @IBOutlet weak var tipAmountField: UITextField!
    @IBOutlet weak var totalAmount: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //IBActions
    @IBAction func calculateTip(_ sender: UIButton) {
        if let billAmount = Double(billAmountField.text!){
            var tipPercentage = 0.0
            
            switch tipPercent.selectedSegmentIndex{
            case 0:
                tipPercentage = 0.10
            case 1:
                tipPercentage = 0.15
            case 2:
                tipPercentage = 0.18
            default:
                break
            }
            
            let roundedBillAmount = round(100 * billAmount) / 100
            let tipAmount = roundedBillAmount * tipPercentage
            let roundedTipAmount = round(100 * tipAmount) / 100
            let totalBillAmount = roundedBillAmount + roundedTipAmount
            
            if (!billAmountField.isEditing){
                billAmountField.text = String(format: "%.2f")
            }
            
            tipAmountField.text = String(format: "%.2f", roundedTipAmount)
            totalAmount.text = String(format: "%.2f", totalBillAmount)
            
        }else{
            //show error
            billAmountField.text = ""
            tipAmountField.text = ""
            totalAmount.text = ""
        }
    }

}

