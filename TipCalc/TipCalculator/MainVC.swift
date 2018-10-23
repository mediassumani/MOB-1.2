//
//  MainVC.swift
//  TipCalculator
//
//  Created by Medi Assumani on 8/20/18.
//  Copyright © 2018 Assumani, Medi. All rights reserved.
//

import Foundation
import UIKit

class MainVC: UIViewController{
    
        // TITLE
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
        // INPUTS
    @IBOutlet weak var inputCardView: UIView!
    @IBOutlet weak var tipPercentLabel: UILabel!
    @IBOutlet weak var tipPercentSegment: UISegmentedControl!
    
        // OUTPUTS
    @IBOutlet weak var outputCardView: UIView!
    @IBOutlet weak var tipAmountTitleLabel: UILabel!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalAmountTitleLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    
    
        // Code that process when the theme switch has been toggled
    @IBAction func themeSwitchToggled(_ sender: UISwitch) {
        if sender.isOn{
            print("Dark Theme activated")
        }else {
            print("Light Theme activated")
        }
    }
    
        // Code that process when the percent has changed
    @IBAction func TipPercentHasChanged(_ sender: UISegmentedControl) {
        
    }
        // Code that process when the reset button has been pressed
    @IBAction func resetButtonPressed(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
