//
//  ViewController.swift
//  TipCalculator
//
//  Created by Assumani, Medi on 1/31/18.
//  Copyright © 2018 Assumani, Medi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // - MARK : IBOULETS 
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountTextField: UITextField!
    @IBOutlet weak var totalAmountTextField: UITextField!
    @IBOutlet weak var tipPercentSelector: UISegmentedControl!
    
    
    // - MARK : IBACTIONS
    @IBAction func calculateButtonTaped(_ sender: Any) {
        
        
        if let billAmount = Double(self.billAmountTextField.text!){
            var tipPercentage = 0.0
            
            switch self.tipPercentSelector.selectedSegmentIndex {
            case 0:
                
                tipPercentage = 5.0
                
            case 1:
                
                tipPercentage = 10.0
                
            case 2:
                
                tipPercentage = 20.0
                
            default:
                
                break
            }
            
            let restaurant_client : Payroll = Payroll(billAmount,tipPercentage)
            self.tipAmountTextField.text  = String(format : "%.2f", restaurant_client.computeTipAmount())
            self.totalAmountTextField.text = String(format: "%.2f", restaurant_client.computeTotalAmount())
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

